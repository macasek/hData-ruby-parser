class UnitValue < XMLBase
  xml_namespace :hdataResultNs
  
  xml_accessor :units, :from => :attr
  xml_accessor :value, :from => :attr
  
  def initialize(values = {}, body=nil)
    super()   
    self.units = values["units"]
    self.value = values["value"]
  end
end