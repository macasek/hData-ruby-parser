module ActorManagement
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
    def actor
      (person.nil?) ? organization : person
    end
  
    def actor=(a)
      if(a.class == Organization)
        organization = a
        person = nil
      elsif(a.class == Person)
        organization = nil
        person = a
      else
        organization = nil
        person = nil
        raise ArgumentError, "Actor must be a person or organization", caller
      end
    end
  
    def actor_valid?
      (!organization.nil? && !person.nil?) ? false : true
    end
  end
end