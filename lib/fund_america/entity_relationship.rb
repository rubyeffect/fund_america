module FundAmerica
  class EntityRelationship
    class << self

      # End point: https://apps.fundamerica.com/api/entity_relationships (GET)
      # Usage: FundAmerica::EntityRelationship.list
      # Output: Returns list of entity_relationships
      def list
        API::request(:get, 'entity_relationships')
      end

      # End point: https://apps.fundamerica.com/api/entity_relationships (POST)
      # Usage: FundAmerica::EntityRelationship.create(options)
      # Output: Creates a new entity_relationship
      def create(options)
        API::request(:post, 'entity_relationships', options)
      end

      # End point: https://apps.fundamerica.com/api/entity_relationships/:id (PATCH)
      # Usage: FundAmerica::EntityRelationship.update(entity_relationship_id, options)
      # Output: Updates an entity_relationship
      def update(entity_relationship_id, options)
        end_point_url = "entity_relationships/#{entity_relationship_id}"
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/entity_relationships/:id (GET)
      # Usage: FundAmerica::EntityRelationship.details(entity_relationship_id)
      # Output: Returns the details of an entity_relationship with matching id
      def details(entity_relationship_id)
        API::request(:get, "entity_relationships/#{entity_relationship_id}")
      end

      # End point: https://apps.fundamerica.com/api/entity_relationships/:id (DELETE)
      # Usage: FundAmerica::EntityRelationship.delete(entity_relationship_id)
      # Output: Deletes an entity_relationship with matching id
      def delete(entity_relationship_id)
        API::request(:delete, "entity_relationships/#{entity_relationship_id}")
      end

    end
  end
end
