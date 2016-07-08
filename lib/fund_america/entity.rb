module FundAmerica
  class Entity
    class << self

      # End point: https://apps.fundamerica.com/api/entities (GET)
      # Usage: FundAmerica::Entity.list
      # Output: Returns list of entities
      def list
        API::request(:get, 'entities')
      end

      # End point: https://apps.fundamerica.com/api/entities (POST)
      # Usage: FundAmerica::Entity.create(options)
      # Output: Creates a new entity - person or company
      def create(options)
        API::request(:post, 'entities', options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id (PATCH)
      # Usage: FundAmerica::Entity.update(entity_id, options)
      # Output: Updates an entity - person or company
      # Uses test_mode update when used in sandbox mode
      def update(entity_id, options)
        end_point_url = FundAmerica.base_uri + "#{FundAmerica.mode == 'sandbox' ? 'test_mode/' : ''}" + "entities/#{entity_id}"
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id (GET)
      # Usage: FundAmerica::Entity.details(entity_id), request options &_expand[<attribute_name>]=1
      # Output: Returns the details of an entity with matching id
      def details(entity_id, request_options = "")
        API::request(:get, "entities/#{entity_id}" + request_options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id (DELETE)
      # Usage: FundAmerica::Entity.delete(entity_id)
      # Output: Deletes an entity with matching id

      # TODO - The delete option from sandbox mode gives the error message
      # FundAmerica::Error: Not authorized.
      # You don't have permission to take action on a particular resource.
      # It may not be owned by your account or it may be in a state
      # where you action cannot be taken (such as attempting to cancel an invested investment)
      # This request has to be tested with production mode in final testing phase
      def delete(entity_id)
        API::request(:delete, "entities/#{entity_id}")
      end

      # End point: https://apps.fundamerica.com/api/entities/:entity_id/ach_authorizations (GET)
      # Usage: FundAmerica::Entity.ach_authorizations(entity_id)
      # Output: Returns ACH authorizations of an entity
      def ach_authorizations(entity_id)
        API::request(:get, "entities/#{entity_id}/ach_authorizations")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/cash_blotter (GET)
      # Usage: FundAmerica::Entity.cash_blotter(entity_id)
      def cash_blotter(entity_id)
        API::request(:get, "entities/#{entity_id}/cash_blotter")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/investor_suitability (GET)
      # Usage: FundAmerica::Entity.investor_suitability_details(entity_id)
      def investor_suitability_details(entity_id)
        API::request(:get, "entities/#{entity_id}/investor_suitability")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/investor_suitability (PATCH)
      # Usage: FundAmerica::Entity.investor_suitability_update(entity_id, options)
      def investor_suitability_update(entity_id, options)
        API::request(:patch, "entities/#{entity_id}/investor_suitability", options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/investor_payments (GET)
      # Usage: FundAmerica::Entity.investor_payments(entity_id)
      def investor_payments(entity_id)
        API::request(:get, "entities/#{entity_id}/investor_payments")
      end

      # https://apps.fundamerica.com/api/entities/:id/bank_transfer_methods (GET)
      # Usage: FundAmerica::Entity.bank_transfer_methods
      # Output: Returns Bank Transfer Method informations of an entity
      def bank_transfer_method(entity_id)
        API::request(:get, "entities/#{entity_id}/bank_transfer_methods")
      end

      # https://apps.fundamerica.com/api/entities/:id/child_entities (GET)
      # Usage: FundAmerica::Entity.child_entities
      # Output: Returns child entities of an entity
      def child_entities(entity_id)
        API::request(:get, "entities/#{entity_id}/child_entities")
      end

      # https://apps.fundamerica.com/api/entities/:id/parent_entities (GET)
      # Usage: FundAmerica::Entity.parent_entities
      # Output: Returns parent entities of an entity
      def parent_entities(entity_id)
        API::request(:get, "entities/#{entity_id}/parent_entities")
      end

      # https://apps.fundamerica.com/api/entities/:id/relationships_as_child (GET)
      # Usage: FundAmerica::Entity.relationships_as_child
      # Output: Returns relationships_as_child details for entity
      def relationships_as_child(entity_id)
        API::request(:get, "entities/#{entity_id}/relationships_as_child")
      end

      # https://apps.fundamerica.com/api/entities/:id/relationships_as_parent (GET)
      # Usage: FundAmerica::Entity.relationships_as_parent
      # Output: Returns relationships_as_parent details for entity
      def relationships_as_parent(entity_id)
        API::request(:get, "entities/#{entity_id}/relationships_as_parent")
      end

      # https://apps.fundamerica.com/api/entities/:id/investor_accreditation (GET)
      # Usage: FundAmerica::Entity.investor_accreditation
      # Output: Returns entity specific investor accreditation 
      def investor_accreditation(entity_id)
        API::request(:get, "entities/#{entity_id}/investor_accreditation")
      end

    end
  end
end
