class BirthPlace < XMLBase
  xml_namespace :hdataCoreNs
  
  xml_accessor :address, :as => Address
end