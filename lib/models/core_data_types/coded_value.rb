class CodedValue < XMLBase  
  xml_namespace :hdataCoreNs
  
  xml_accessor :code, :from => :attr
  xml_accessor :code_system, :from => :attr
  xml_accessor :version, :from => :attr
  xml_accessor :display_name, :from => :attr
  xml_accessor :value, :from => :content
end