class Section < XMLBase
  xml_accessor :type_id, :from => :attr
  xml_accessor :path, :from => :attr
  xml_accessor :name, :from => :attr
  xml_accessor :sections, :as => [Section]
  
  def self.find_section_from_path(sections, path)
    if(sections.empty?)
      return nil
    end
    
    curr_path = path.shift

    section = sections.find{ |s| s.path == curr_path }
   
    if(path.empty?)
      return section
    elsif(!section.sections.empty?)
      return Section.find_section_from_path(section.sections, path)
    end
    
    return nil
  end
end