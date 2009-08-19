class DateRange < XMLBase
  xml_namespace :hdataCoreNs
    
  xml_accessor :high, :as => DateTime, :from => :attr
  xml_accessor :low, :as => DateTime, :from => :attr
end