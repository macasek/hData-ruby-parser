class Condition < XMLBase
  xml_namespace :hdataConditionNs
  
  xml_accessor :date_range, :as => DateRange, :from => "hdataCoreNs:dateRange"
  xml_accessor :type, :as => CodedValue
  xml_accessor :treating_providers, :as => [TreatingProvider]
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end