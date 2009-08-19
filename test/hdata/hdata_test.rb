require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class HdataTest < Test::Unit::TestCase  
  context 'Hdata' do
    setup do
      @patient_id = "1234"   
    end
    
    context "from local file system" do
      setup do
        @uri = File.expand_path(File.dirname(__FILE__) + '/../data')
      end

      should "create instance" do
        hdata = Hdata.new(@patient_id, @uri)
          
        assert_equal hdata.patient_id, @patient_id
        assert_equal hdata.uri, @uri
        assert_equal hdata.path, []
        assert_equal hdata.local, true
        assert_equal hdata.root.class, Root
        assert_equal hdata.section_data.length, 1
        assert_equal hdata.section_data.first.class, Root
        assert_equal hdata.error, nil
      end
      
      should "get patient info" do
        patient_file_path = File.expand_path(File.dirname(__FILE__) + "/../data/1234/patient_information/patient1.xml")   
        patient_file_contents = File.read(patient_file_path)      
        patient = Patient.from_xml(patient_file_contents)
        
        assert_equal patient.class, Patient
      end
      
      should "get unit value result" do
        result_file_path = File.expand_path(File.dirname(__FILE__) + "/../data/1234/laboratories/results/results1.xml")   
        result_file_contents = File.read(result_file_path)      
        result = Result.from_xml(result_file_contents)
        
        assert_equal result.value.class, UnitValue
      end
      
      should "get bp result" do
        result_file_path = File.expand_path(File.dirname(__FILE__) + "/../data/1234/laboratories/results/results2.xml")   
        result_file_contents = File.read(result_file_path)
        result = Result.from_xml(result_file_contents)
      
        assert_equal result.value.class, Bp
      end
      
      should "have invalid actor" do
        provider_file_path = File.expand_path(File.dirname(__FILE__) + "/../data/standalone/bad_actor_healthcare_provider.xml")   
        provider_file_contents = File.read(provider_file_path)
        exception = nil
        begin
          healthcare_provider = HealthcareProvider.from_xml(provider_file_contents)
        rescue ArgumentError => e
          exception = e
        end
        
        assert_equal exception.class, ArgumentError
      end
    end
    
    context "from remote file system" do
      setup do  
        root_file_path = File.expand_path(File.dirname(__FILE__) + "/../data/1234/root.xml")   
        root_file_contents = File.read(root_file_path) 
        FakeWeb.register_uri(:get, "http://projecthedata/hrecords/1234/root.xml", :body => root_file_contents)
        @uri = "http://projecthedata/hrecords/"
      end
    
      should "create instance" do
        hdata = Hdata.new(@patient_id, @uri, [], false)
    
        assert_equal hdata.patient_id, @patient_id
        assert_equal hdata.uri, @uri
        assert_equal hdata.path, []
        assert_equal hdata.local, false
        assert_equal hdata.root.class, Root
        assert_equal hdata.section_data.length, 1
        assert_equal hdata.section_data.first.class, Root
        assert_equal hdata.error, nil
      end
    end
  end
end