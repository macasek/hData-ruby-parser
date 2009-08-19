class Entry < XMLBase
  xml_accessor :title
  xml_accessor :link, :as => Link
  xml_accessor :author, :as => FeedAuthor
end