class Hdata
  attr_accessor :patient_id, :uri, :path, :local, :root, :section_data, :error
  
  SECTION_TO_CLASS_NAME_MAP = {
    "http://projecthdata.org/hdata/schemas/2009/06/advance_directive" => "AdvanceDirective",
    "http://projecthdata.org/hdata/schemas/2009/06/allergy" => "Allergy",
    "http://projecthdata.org/hdata/schemas/2009/06/comment" => "Comment",
    "http://projecthdata.org/hdata/schemas/2009/06/condition" => "Condition",
    "http://projecthdata.org/hdata/schemas/2009/06/encounter" => "Encounter",
    "http://projecthdata.org/hdata/schemas/2009/06/provider" => "HealthcareProvider",
    "http://projecthdata.org/hdata/schemas/2009/06/immunization" => "Immunization",
    "http://projecthdata.org/hdata/schemas/2009/06/insurance_provider" => "InsuranceProvider",
    "http://projecthdata.org/hdata/schemas/2009/06/medication" => "Medication",
    "http://projecthdata.org/hdata/schemas/2009/06/patient_information" => "Patient",
    "http://projecthdata.org/hdata/schemas/2009/06/procedure" => "Procedure",
    "http://projecthdata.org/hdata/schemas/2009/06/result" => "Result",
    "http://projecthdata.org/hdata/schemas/2009/06/core" => "Root",
    "http://projecthdata.org/hdata/schemas/2009/06/support" => "Support"
  }
  
  EMPTY_SECTION_TYPE = "urn:empty"
  DEFAULT_LOG_PATH = "hdata_parser.log"
  
  def initialize(pid, uri, path=[], local=true)
    @patient_id = pid
    @uri = uri
    @path = path
    @local = local
    
    params = [@patient_id, @path, @uri]
    @section_data, @root, @error = @local ? load_from_file_system(*params) : load_from_remote_system(*params) 
  end
  
private  
  def load_from_file_system(patient_id, section_path, base_file_system_path)
    error = nil
    root_obj = nil
    objs = []
    file_contents = []
    
    patient_dir = File.join(base_file_system_path, patient_id)
    if(!File.directory?(patient_dir))
      error = "I cannot find a patient at path: " + patient_dir
    else
      root_file_path = File.expand_path(File.join(patient_dir, "root.xml"))
      root_file_contents = File.read(root_file_path)
      root_obj = Root.from_xml(root_file_contents)

      if(section_path.empty?)
        file_contents << root_file_contents
        section_type = Root
      else
        if(!File.directory?(patient_dir + "/" + section_path.join("/")))          
          error = "I cannot a directory at path: " + section_path.join("/")
        else
          d = Dir.new(patient_dir + "/" + section_path.join("/"))
          d.entries.each { |n| file_contents << File.read(d.path+"/"+n) if ((n.index(".") != 0) && File.file?(d.path+"/"+n)) }  

          if(file_contents.empty?)
            error = "I cannot find any documents at path: " + section_path.join("/")
          else      
            section_type, error = get_section_type(root_obj.sections, section_path)
          end
        end
      end
    end
    
    if(!file_contents.empty?)
      objs = file_contents.map { |file_content| section_type.from_xml(file_content) }
    end
    
    return objs, root_obj, error
  end

  def load_from_remote_system(patient_id, section_path, base_remote_system_url)
    error = nil
    root_obj = nil
    objs = []
    document_contents = []
    
    base_patient_url = base_remote_system_url + ((base_remote_system_url[-1..-1] == "/") ? "" : "/") +  patient_id   
    root_url = base_patient_url + "/root.xml"
    root_file_contents = fetch_from_url(root_url)

    if(root_file_contents.nil?)
      error = "Unable to fetch root document for patient: #{patient_id}"
    else
      root_obj = Root.from_xml(root_file_contents)
      
      if(section_path.empty?)
        document_contents << root_file_contents
        section_type = Root
      else
        document_url = base_patient_url + "/" + section_path.join("/")
        documents_feed = fetch_from_url(document_url)

        if(documents_feed.nil?)
          error = "Unable to fetch documents feed from url: #{document_url}"
        else
          feed = Feed.from_xml(documents_feed)
          document_contents = feed.entries.map { |entry| fetch_from_url(entry.link.href)}
        
          if(document_contents.empty?)   
            error = "Unable to fetch documents"     
          else  
            if(document_contents.detect {|item| item.nil? })
              error = "Unable to fetch some of the documents, attempting to continue."
              document_contents = document_contents.select {|item| !item.nil? }
            end
            
            section_type, error = get_section_type(root_obj.sections, section_path)            
          end
        end
      end
    end
  
    if(!document_contents.empty?)
      objs = document_contents.map { |document_content| section_type.from_xml(document_content) }
    end

    return objs, root_obj, error
  end

  def get_section_type(sections, section_path)
    section_type = nil
    error = nil
    
    curr_section = Section.find_section_from_path(sections, section_path)

    if(curr_section.nil?)
      error =  "I cannot find a section type for path: " + section_path.join("/")
    else
      if(curr_section.type_id == EMPTY_SECTION_TYPE)
        error =  "There is no class for type id: " + curr_section.type_id
      else
        section_type = Kernel.const_get(SECTION_TO_CLASS_NAME_MAP[curr_section.type_id])

        if(section_type.nil?)
          error =  "I cannot find the class for section: " + curr_section.type_id + " " + curr_section.name + " "+ curr_section.path
        end
      end
    end
    
    return section_type, error
  end

  def fetch_from_url(url)
    begin
      response = open(url)
      content = response.read
    rescue Exception => e
      logger.error("Error fetching data at url: #{url} with exception: #{e.message}")
      content = nil
    end
    
    content
  end
  
  def logger
    @logger ||= Logger.new(defined?(HDATA_LOG_PATH) ? HDATA_LOG_PATH : DEFAULT_LOG_PATH)
  end
end