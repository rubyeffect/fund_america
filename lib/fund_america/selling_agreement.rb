module FundAmerica
  class SellingAgreement
    class << self

      # End point: https://apps.fundamerica.com/api/selling_agreements (POST)
      # Usage: FundAmerica::SellingAgreement.create(options)
      # Output: Creates a new rta_agreement
      def create(options)
        API::request(:post, 'selling_agreements', options)
      end

      # End point: https://apps.fundamerica.com/api/selling_agreements/:id (GET)
      # Usage: FundAmerica::SellingAgreement.details(selling_agreement_id)
      # Output: Returns the details of an rta_agreement with matching id
      def details(selling_agreement_id)
        API::request(:get, "selling_agreements/#{selling_agreement_id}")
      end

    end
  end
end
