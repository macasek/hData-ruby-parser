class Payer < XMLBase
  include ActorManagement
  
  xml_namespace :hdataInsuranceProviderNs
    
  xml_reader :source_id
  
  # these really need to be private. they should only be accessed via the ActorManagement methods
  xml_accessor :organization, :as => Organization, :from => "hdataCoreNs:organization"  
  xml_accessor :person, :as => Person, :from => "hdataCoreNs:person" 
  
  def after_parse
    if(!actor_valid?)
      raise ArgumentError, "Actor must be a person or organization", caller
    end
  end
end