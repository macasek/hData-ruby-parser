class Actor < XMLBase
  include ActorManagement
  
  xml_namespace :hdataCoreNs
  
  # these really need to be private. they should only be accessed via the ActorManagement methods
  # TODO this is a little messy because to get this data you would call object.actor.actor
  xml_accessor :organization, :as => Organization  
  xml_accessor :person, :as => Person  
  
  def after_parse
    if(!actor_valid?)
      raise ArgumentError, "Actor must be a person or organization", caller
    end
  end
end