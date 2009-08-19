class Telecom < XMLBase
  xml_namespace :hdataCoreNs

  xml_accessor :value, :from => :attr
  xml_accessor :use, :from => :attr
end