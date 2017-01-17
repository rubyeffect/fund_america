module FundAmerica
  class RtaAgreement
    class << self

      # End point: https://apps.fundamerica.com/api/rta_agreements (GET)
      # Usage: FundAmerica::RTAAgreement.list
      # Output: Returns list of rta_agreements
      def list
        API::request(:get, FundAmerica.base_uri + 'rta_agreements')
      end

      # End point: https://apps.fundamerica.com/api/rta_agreements (POST)
      # Usage: FundAmerica::RTAAgreement.create(options)
      # Output: Creates a new rta_agreement
      def create(options)
        API::request(:post, FundAmerica.base_uri + 'rta_agreements', options)
      end

      # End point: https://apps.fundamerica.com/api/rta_agreements/:id (GET)
      # Usage: FundAmerica::RTAAgreement.details(rta_agreement_id)
      # Output: Returns the details of an rta_agreement with matching id
      def details(rta_agreement_id)
        API::request(:get, FundAmerica.base_uri + "rta_agreements/#{rta_agreement_id}")
      end

    end
  end
end
