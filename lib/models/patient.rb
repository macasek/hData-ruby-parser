class Patient < Person
  xml_namespace :hdataPatientNs

  xml_reader :id
  xml_accessor :languages, :as => [Language]
  xml_accessor :gender, :as => CodedValue
  xml_accessor :birthtime, :as => CoreDate
  xml_accessor :marital_status, :as => CodedValue
  xml_accessor :races, :as => [CodedValue]
  xml_accessor :birth_place, :as => BirthPlace
  xml_accessor :guardians, :as => [Actor]  
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
end