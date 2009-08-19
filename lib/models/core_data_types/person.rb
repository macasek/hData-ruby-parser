class Person < XMLBase
  xml_accessor :name, :as => Name, :from => "hdataCoreNs:name"
  xml_accessor :addresses, :as => [Address], :from => "hdataCoreNs:addresses"
  xml_accessor :telecoms, :as => [Telecom], :from => "hdataCoreNs:telecoms"
end