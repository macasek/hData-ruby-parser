class Medication < XMLBase
  xml_namespace :hdataMedicationNs
  
  xml_accessor :product, :as => MedicationProduct
  xml_accessor :type, :as => CodedValue
  xml_accessor :status, :as => CodedValue
  xml_accessor :order_information, :as => OrderInformation
  xml_accessor :perscription, :as => Perscription
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end