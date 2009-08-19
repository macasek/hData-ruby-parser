class Value < XMLBase
  xml_namespace :hdataResultNs
  
  xml_reader :values, :from => "@*"
  xml_reader :body, :from => :content
end