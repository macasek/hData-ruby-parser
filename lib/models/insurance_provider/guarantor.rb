class Guarantor < XMLBase
  include ActorManagement
  
  xml_namespace :hdataInsuranceProviderNs  
  
  xml_accessor :date, :as => CoreDate, :from => "hdataCoreNs:date"
  
  # these really need to be private. they should only be accessed via the ActorManagement methods
  xml_accessor :organization, :as => Organization, :as => Organization, :from => "hdataCoreNs:organization"  
  xml_accessor :person, :as => Person, :as => Organization, :from => "hdataCoreNs:person" 
  
  def after_parse
    if(!actor_valid?)
      raise ArgumentError, "Actor must be a person or organization", caller
    end
  end
end