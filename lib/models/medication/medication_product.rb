class MedicationProduct < XMLBase
  xml_namespace :hdataMedicationNs
  
  xml_accessor :name
  xml_accessor :code, :as => CodedValue
  xml_accessor :lot_number
  xml_accessor :brand_name
  xml_accessor :manufacturer, :as => Organization
end