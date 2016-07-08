module FundAmerica
  class EscrowAgreement
    class << self

      # End point: https://apps.fundamerica.com/api/escrow_agreements (GET)
      # Usage: FundAmerica::EscrowAgreement.list
      # Output: Returns list of escrow_agreements
      def list
        API::request(:get, 'escrow_agreements')
      end

      # End point: https://apps.fundamerica.com/api/escrow_agreements (POST)
      # Usage: FundAmerica::EscrowAgreement.create(options)
      # Output: Creates a new escrow_agreement
      def create(options)
        API::request(:post, 'escrow_agreements', options)
      end

      # End point: https://apps.fundamerica.com/api/escrow_agreements/:id (GET)
      # Usage: FundAmerica::EscrowAgreement.details(escrow_agreement_id)
      # Output: Returns the details of an escrow_agreement with matching id
      def details(escrow_agreement_id)
        API::request(:get, "escrow_agreements/#{escrow_agreement_id}")
      end

    end
  end
end
