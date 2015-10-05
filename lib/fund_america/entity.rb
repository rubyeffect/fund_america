module FundAmerica
  class Entity
    class << self

      # End point: https://apps.fundamerica.com/api/entities (GET)
      # Usage: FundAmerica::Entity.list
      # Output: Returns list of entities
      def list
        API::request(:get, FundAmerica.base_uri + 'entities')
      end

      # End point: https://apps.fundamerica.com/api/entities (POST)
      # Usage: FundAmerica::Entity.create(options)
      # Output: Creates a new entity - person or company
      def create(options)
        API::request(:post, FundAmerica.base_uri + 'entities', options)
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
      # Usage: FundAmerica::Entity.details(entity_id)
      # Output: Returns the details of an entity with matching id
      def details(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}")
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
        API::request(:delete, FundAmerica.base_uri + "entities/#{entity_id}")
      end

      # End point: https://apps.fundamerica.com/api/entities/:entity_id/ach_authorizations (GET)
      # Usage: FundAmerica::Entity.ach_authorizations(entity_id)
      # Output: Returns ACH authorizations of an entity
      def ach_authorizations(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}/ach_authorizations")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/cash_blotter (GET)
      # Usage: FundAmerica::Entity.cash_blotter(entity_id)
      def cash_blotter(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}/cash_blotter")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/investor_suitability (GET)
      # Usage: FundAmerica::Entity.investor_suitability_details(entity_id)
      def investor_suitability_details(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}/investor_suitability")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/investor_suitability (PATCH)
      # Usage: FundAmerica::Entity.investor_suitability_update(entity_id, options)
      def investor_suitability_update(entity_id, options)
        API::request(:patch, FundAmerica.base_uri + "entities/#{entity_id}/investor_suitability", options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/investor_payments (GET)
      # Usage: FundAmerica::Entity.investor_payments(entity_id)
      def investor_payments(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}/investor_payments")
      end


    end
  end
end
