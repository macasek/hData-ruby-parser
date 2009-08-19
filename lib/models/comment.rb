class Comment < XMLBase
  xml_namespace :hdataCommentNs
  
  xml_accessor :author, :as => Person
  xml_accessor :date, :as => CoreDate, :from => "hdataCoreNs:date"
  xml_accessor :text
end