class Description < XMLBase
  xml_namespace :hdataCoreNs

  xml_accessor :text
  xml_accessor :coded_values, :as => [CodedValue]
end