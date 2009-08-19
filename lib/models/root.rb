class Root < XMLBase
  xml_reader :document_id
  xml_accessor :version
  xml_reader :created, :as => CoreDate
  xml_accessor :last_modified, :as => CoreDate
  xml_accessor :extensions, :as => [Extension]
  xml_accessor :sections, :as => [Section]
end