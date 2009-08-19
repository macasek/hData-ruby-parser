class OrderInformation < XMLBase
  xml_namespace :hdataPerscriptionNs
  
  xml_accessor :order_number, :from => :attr
  xml_accessor :experiation_date, :as => CoreDate, :from => :attr
  xml_accessor :quantity, :as => Integer, :from => :attr
end