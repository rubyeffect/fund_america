module FundAmerica
  class PlaidAuthentication
    class << self

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication (GET)
      # Usage: FundAmerica::PlaidAuthentication.list(entity_id)
      # Output: Returns list of plaid_authentications
      def list(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication (POST)
      # Usage: FundAmerica::PlaidAuthentication.create(entity_id, options)
      # Output: Creates a new plaid_authentication
      def create(entity_id, options)
        API::request(:post, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication", options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication (DELETE)
      # Usage: FundAmerica::PlaidAuthentication.delete(entity_id)
      def delete(entity_id)
        API::request(:delete, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication/institutions (GET)
      # Usage: FundAmerica::PlaidAuthentication.institutions(entity_id)
      def institutions(entity_id)
        API::request(:get, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication/institutions")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication/mfa/device (POST)
      # Usage: FundAmerica::PlaidAuthentication.mfa_device(entity_id, options)
      def mfa_device(entity_id, options)
        API::request(:post, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication/mfa/device", options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication/mfa/questions (POST)
      # Usage: FundAmerica::PlaidAuthentication.mfa_questions(entity_id, options)
      def mfa_questions(entity_id, options)
        API::request(:post, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication/mfa/questions", options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/plaid_authentication/mfa/selections (POST)
      # Usage: FundAmerica::PlaidAuthentication.mfa_selections(entity_id, options)
      def mfa_selections(entity_id, options)
        API::request(:post, FundAmerica.base_uri + "entities/#{entity_id}/plaid_authentication/mfa/selections", options)
      end

    end
  end
end
