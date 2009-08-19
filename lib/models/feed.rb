class Feed < XMLBase
  xml_accessor :title
  xml_accessor :link, :as => Link
  xml_accessor :entries, :as => [Entry]
end