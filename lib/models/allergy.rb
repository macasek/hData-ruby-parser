class Allergy < XMLBase
  xml_namespace :hdataAllergyNs
  
  xml_accessor :date, :as => CoreDate, :from => "hdataCoreNs:date"
  xml_accessor :type, :as => CodedValue
  xml_accessor :product, :as => CodedValue
  xml_accessor :reaction, :as => CodedValue
  xml_accessor :severity, :as => CodedValue
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end