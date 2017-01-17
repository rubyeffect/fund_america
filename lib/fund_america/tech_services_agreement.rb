module FundAmerica
  class TechServicesAgreement
    class << self

      # End point: https://apps.fundamerica.com/api/tech_services_agreements (GET)
      # Usage: FundAmerica::TechServicesAgreement.list
      # Output: Returns list of tech_services_agreements
      def list
        API::request(:get, FundAmerica.base_uri + 'tech_services_agreements')
      end

      # End point: https://apps.fundamerica.com/api/tech_services_agreements (POST)
      # Usage: FundAmerica::TechServicesAgreement.create(options)
      # Output: Creates a new tech_services_agreement
      def create(options)
        API::request(:post, FundAmerica.base_uri + 'tech_services_agreements', options)
      end

      # End point: https://apps.fundamerica.com/api/tech_services_agreements/:id (GET)
      # Usage: FundAmerica::TechServicesAgreement.details(tech_services_agreement_id)
      # Output: Returns the details of an tech_services_agreement with matching id
      def details(tech_services_agreement_id)
        API::request(:get, FundAmerica.base_uri + "tech_services_agreements/#{tech_services_agreement_id}")
      end

    end
  end
end
