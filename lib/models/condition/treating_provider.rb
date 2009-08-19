class TreatingProvider < XMLBase
  include ActorManagement
  
  xml_namespace :hdataCoreNs
  
  xml_accessor :date_range, :as => DateRange
  
  # these really need to be private. they should only be accessed via the ActorManagement methods
  xml_accessor :organization, :as => Organization  
  xml_accessor :person, :as => Person 
  
  def after_parse
    if(!actor_valid?)
      raise ArgumentError, "Actor must be a person or organization", caller
    end
  end
end