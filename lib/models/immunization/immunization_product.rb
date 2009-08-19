class ImmunizationProduct < XMLBase
  xml_namespace :hdataImmunizationNs
  
  xml_accessor :name, :as => CodedValue
  xml_accessor :material, :as => Material
  xml_accessor :manufacturer, :as => Organization
end