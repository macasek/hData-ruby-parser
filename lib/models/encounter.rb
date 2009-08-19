class Encounter < XMLBase
  xml_namespace :hdataEncounterNs
  
  xml_accessor :provider, :as => Actor
  xml_accessor :type, :as => CodedValue
  xml_accessor :date_range, :as => DateRange, :from=>"hdataCoreNs:dateRange"
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end