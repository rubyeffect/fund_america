module FundAmerica
  class AchAuthorization
    class << self

      # End point: https://apps.fundamerica.com/api/ach_authorizations (GET)
      # Usage: FundAmerica::AchAuthorization.list
      # Output: Returns list of ach_authorizations
      def list
        API::request(:get, 'ach_authorizations')
      end

      # End point: https://apps.fundamerica.com/api/ach_authorizations (POST)
      # Usage: FundAmerica::AchAuthorization.create(options)
      # Output: Creates a new ach_authorization
      def create(options)
        API::request(:post, 'ach_authorizations', options)
      end

      # End point: https://apps.fundamerica.com/api/ach_authorizations/:id (GET)
      # Usage: FundAmerica::AchAuthorization.details(ach_authorization_id)
      # Output: Returns the details of an ach_authorization with matching id
      def details(ach_authorization_id)
        API::request(:get, "ach_authorizations/#{ach_authorization_id}")
      end

      # End point: https://apps.fundamerica.com/api/ach_authorizations/:id (DELETE)
      # Usage: FundAmerica::AchAuthorization.delete(ach_authorization_id)
      # Output: Deletes an ach_authorization with matching id
      def delete(ach_authorization_id)
        API::request(:delete, "ach_authorizations/#{ach_authorization_id}")
      end

      # End point: https://apps.fundamerica.com/api/ach_authorizations/agreement_html (GET)
      # Usage: FundAmerica::AchAuthorization.agreement_html
      # Output: Returns the ACH authorization HTML
      def agreement_html
        API::request(:get, "ach_authorizations/agreement_html")
      end

      # End point: https://apps.fundamerica.com/api/ach_tokens (POST)
      # Usage: FundAmerica::AchAuthorization.ach_tokens(options)
      # Output: Returns ACH token

      # TODO - As ACH token has a single end point it has been clubbed with
      # ACH authorizations. Either all end points that are single methods
      # have to be taken in a common file separately or clubbed with related
      # end point set. To be discussed further on approach
      def ach_tokens(options)
        API::request(:post, 'ach_tokens', options)
      end

    end
  end
end
