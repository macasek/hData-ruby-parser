class CoreDate < XMLBase
  xml_namespace :hdataCoreNs

  xml_accessor :value, :as => DateTime, :from => :content
end