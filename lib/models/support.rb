class Support < XMLBase
  xml_namespace :hdataSupportNs
  
  xml_accessor :type, :as => CodedValue
  xml_accessor :date_range, :as => DateRange, :from => "hdataCoreNs:dateRange"
  xml_accessor :relationship, :as => CodedValue
  xml_accessor :person, :as => Person, :from => "hdataCoreNs:person"
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end