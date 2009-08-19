class AdvanceDirective < XMLBase
  xml_namespace :hdataAdvanceDirectiveNs
  
  xml_accessor :type, :as => CodedValue
  xml_accessor :date, :as => CoreDate, :from => "hdataCoreNs:date"
  xml_accessor :custodian, :as => Actor
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end