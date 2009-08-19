class XMLBase
  include ROXML
  xml_convention {|val| val.camelcase(:lower) } 
end