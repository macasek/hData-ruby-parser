class Organization < XMLBase
  xml_namespace :hdataCoreNs
  
  xml_accessor :name
  xml_accessor :addresses, :as => [Address]
  xml_accessor :points_of_contacts, :as => [Person], :from => "pointOfContacts" 
end