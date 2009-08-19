class Perscription < XMLBase
  xml_namespace :hdataPerscriptionNs
  
  xml_accessor :perscription_number, :from => :attr
  xml_accessor :quantity, :as => Integer, :from => :attr
  xml_accessor :fill_number, :from => :attr
end