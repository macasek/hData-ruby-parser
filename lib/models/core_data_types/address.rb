class Address < XMLBase
  xml_namespace :hdataCoreNs

  xml_accessor :street_addresses, :as => []
  xml_accessor :city
  xml_accessor :state_or_province
  xml_accessor :zip
  xml_accessor :country
end