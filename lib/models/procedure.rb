class Procedure < XMLBase
  xml_namespace :hdataProcedureNs
  
  xml_accessor :date_range, :as => DateRange, :from => "hdataCoreNs:dateRange"
  xml_accessor :type, :as => CodedValue
  xml_accessor :status, :as => CodedValue
  xml_accessor :product, :as => [CodedValue]
  xml_accessor :substance, :as => CodedValue
  xml_accessor :performer, :as => Actor
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end