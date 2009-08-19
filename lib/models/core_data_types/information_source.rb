class InformationSource < XMLBase 
  xml_namespace :hdataCoreNs
   
  xml_accessor :date, :as => CoreDate
  xml_accessor :reference
  xml_accessor :author, :as => Person
  xml_accessor :informant, :as => Actor
end