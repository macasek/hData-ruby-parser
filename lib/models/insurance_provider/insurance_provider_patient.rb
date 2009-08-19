class InsuranceProviderPatient < Person
  xml_namespace :hdataInsuranceProviderNs 
  
  xml_reader :id
  xml_accessor :relationship, :as => CodedValue
end