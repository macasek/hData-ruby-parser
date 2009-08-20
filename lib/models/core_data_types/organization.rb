class Organization < XMLBase
  xml_accessor :name
  xml_accessor :addresses, :as => [Address], :from => "hdataCoreNs:address"
  xml_accessor :points_of_contacts, :as => [Person], :from => "pointOfContacts" 
end