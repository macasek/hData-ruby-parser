module ROXML
  class XMLRef
    def nodes_in(xml)   
      vals = xml.search(xpath)   
      if(xpath == "@*")                 # holy hack pt1! 
        res = {} 
        vals.each {|x| res[x.name]=x.value}
        return res
      elsif (opts.hash? || opts.array?) && vals.empty? && !wrapper && auto_xpath
        vals = xml.search(auto_xpath)
        @auto_vals = !vals.empty?
      end
      if vals.empty?
        raise RequiredElementMissing, "#{name} from #{xml} for #{accessor}" if required?
        default
      else
        yield(vals)
      end
    end
  end
  
  module XML
    module NamespacedSearch
      # this may not be the best place for this...
      HDATA_NS_MAP = {
        "hdataAdvanceDirectiveNs" =>    "http://projecthdata.org/hdata/schemas/2009/06/advance_directive", 
        "hdataAllergyNs" =>             "http://projecthdata.org/hdata/schemas/2009/06/allergy",
        "hdataCoreNs" =>                "http://projecthdata.org/hdata/schemas/2009/06/core",
        "hdataCommentNs" =>             "http://projecthdata.org/hdata/schemas/2009/06/comment",
        "hdataConditionNs" =>           "http://projecthdata.org/hdata/schemas/2009/06/condition", 
        "hdataEncounterNs" =>           "http://projecthdata.org/hdata/schemas/2009/06/encounter", 
        "hdataHealthcareProviderNs" =>  "http://projecthdata.org/hdata/schemas/2009/06/provider",
        "hdataImmunizationNs" =>        "http://projecthdata.org/hdata/schemas/2009/06/immunization", 
        "hdataInsuranceProviderNs" =>   "http://projecthdata.org/hdata/schemas/2009/06/insurance_provider", 
        "hdataMedicationNs" =>          "http://projecthdata.org/hdata/schemas/2009/06/medication", 
        "hdataPatientNs" =>             "http://projecthdata.org/hdata/schemas/2009/06/patient_information", 
        "hdataProcedureNs" =>           "http://projecthdata.org/hdata/schemas/2009/06/procedure",
        "hdataResultNs" =>              "http://projecthdata.org/hdata/schemas/2009/06/result",
        "hdataRootNs" =>                "http://projecthdata.org/hdata/schemas/2009/06/core",
        "hdataSupportNs" =>             "http://projecthdata.org/hdata/schemas/2009/06/support",
      }
      
      def current_context     
        return @current_context if(@current_context)
      
        @current_context = LibXML::XML::XPath::Context.new(self)
        @current_context.node = self
        @current_context.register_namespaces_from_node(self)
        
        HDATA_NS_MAP.each_pair do |key, val|
          @current_context.register_namespace(key, val)
        end

        @current_context
      end
      
      #override this method to change the find.
      def search(xpath)
        context = current_context
        begin
          if namespaces.default && !xpath.include?(':')                      
            find(namespaced(xpath),
                 in_default_namespace(namespaces.default.href))
          else 
            #find(xpath)
            context.find(xpath) 
          end
        rescue Exception => ex
          raise ex, xpath
        end
      end
    end
  end
end