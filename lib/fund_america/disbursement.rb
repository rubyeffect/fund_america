module FundAmerica
  class Disbursement
    class << self

      # End point: https://apps.fundamerica.com/api/disbursements (GET)
      # Usage: FundAmerica::Disbursement.list
      # Output: Returns list of disbursements
      def list(options = {})
        API::request(:get, 'disbursements', options)
      end

      # End point: https://apps.fundamerica.com/api/disbursements/:id (GET)
      # Usage: FundAmerica::Disbursement.details(disbursement_id)
      # Output: Returns the details of a disbursement with matching id
      def details(disbursement_id)
        API::request(:get, "disbursements/#{disbursement_id}")
      end

    end
  end
end 