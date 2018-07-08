module FundAmerica
  class EntityDocument
    class << self
      # End point: https://apps.fundamerica.com/api/entities/:id/entity_documents (GET)
      # Usage:     FundAmerica::EntityDocument.list
      # Output:    Returns list of entity documents
      def list(entity_id)
        API::request(:get, "entities/#{entity_id}/entity_documents")
      end

      # End point: https://apps.fundamerica.com/api/entity_documents (POST)
      # Usage:     FundAmerica::EntityDocument.create(options)
      # Output:    Creates a new entity document
      def create(options)
        API::request(:post, 'entity_documents', options)
      end

      # End point: https://apps.fundamerica.com/api/entity_documents/:id (GET)
      # Usage:     FundAmerica::EntityDocument.details(entity_id), request options &_expand[<attribute_name>]=1
      # Output:    Returns the details of an entity document with matching id
      def details(entity_document_id, request_options = "")
        API::request(:get, "entity_documents/#{entity_document_id}" + request_options)
      end
    end
  end
end
