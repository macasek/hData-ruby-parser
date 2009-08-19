class Extension < XMLBase
  xml_accessor :requirement, :from => :attr
  xml_accessor :value, :from => :content
end