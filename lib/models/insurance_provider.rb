class InsuranceProvider < XMLBase
  xml_namespace :hdataInsuranceProviderNs
  
  xml_accessor :group_number
  xml_accessor :insurance_type, :as => CodedValue
  xml_accessor :name
  xml_accessor :payer, :as => Payer
  xml_accessor :patient, :as => InsuranceProviderPatient
  xml_accessor :subscriber, :as => Subscriber
  xml_accessor :guarantor, :as => Guarantor
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end