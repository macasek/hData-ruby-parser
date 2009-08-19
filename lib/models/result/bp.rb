class Bp < XMLBase
  xml_namespace :hdataResultNs
  
  xml_accessor :distolic, :from => :attr
  xml_accessor :systolic, :from => :attr
  
  def initialize(values = {}, body=nil)
    super()   
    self.distolic = values["distolic"]
    self.systolic = values["systolic"]
  end
end