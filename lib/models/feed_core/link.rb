class Link < XMLBase
  xml_accessor :rel, :from => :attr
  xml_accessor :href, :from => :attr
end