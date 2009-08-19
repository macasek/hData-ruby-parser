class Name < XMLBase
  xml_namespace :hdataCoreNs
  
  xml_accessor :title
  xml_accessor :givens, :as => []
  xml_accessor :lastname
  xml_accessor :suffix
end