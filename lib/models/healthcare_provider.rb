class HealthcareProvider < XMLBase
  include ActorManagement
  
  xml_namespace :hdataHealthcareProviderNs
  
  xml_accessor :date_range, :as => DateRange, :from => "hdataCoreNs:dateRange"
  xml_reader :patient_id
  xml_accessor :role, :as => CodedValue
  xml_accessor :type, :as => CodedValue
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
  
  # these really need to be private. they should only be accessed via the ActorManagement methods
  xml_accessor :organization, :as => Organization, :from => "hdataCoreNs:organization"
  xml_accessor :person, :as => Person, :from => "hdataCoreNs:person" 
  
  def after_parse
    if(!actor_valid?)
      raise ArgumentError, "Actor must be a person or organization", caller
    end
  end
end