class Immunization < XMLBase
  xml_namespace :hdataImmunizationNs
  
  xml_accessor :refusal
  xml_accessor :date, :as => CoreDate, :from => "hdataCoreNs:date"
  xml_accessor :series_number
  xml_accessor :performer, :as => Actor
  xml_accessor :product, :as => ImmunizationProduct
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end