class Result < XMLBase
  xml_namespace :hdataResultNs
  
  xml_reader :id
  xml_accessor :date, :as => CoreDate, :from => "hdataCoreNs:date"
  xml_accessor :result_type, :as => CodedValue
  xml_accessor :value, :as => Value                 # holy hack pt2! 
  xml_accessor :interpretation, :as => CodedValue
  xml_accessor :reference_range
  xml_accessor :description, :as => Description, :from => "hdataCoreNs:description"
  xml_accessor :information_source, :as => InformationSource, :from => "hdataCoreNs:informationSource"
  
  def after_parse                 # holy hack pt3, the final holy hack!     
    type = value.values["type"].camelcase
    klass = Kernel.const_get(type)
    real_value = klass.new(value.values, value.body)
    self.value = real_value
  end
end