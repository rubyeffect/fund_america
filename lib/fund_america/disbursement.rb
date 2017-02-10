module FundAmerica
  class Disbursement
    class << self

      # End point: https://apps.fundamerica.com/api/disbursements (GET)
      # Usage: FundAmerica::Disbursement.list
      # Output: Returns list of distributions
      def list
        API::request(:get, 'disbursements')
      end

      # End point: https://apps.fundamerica.com/api/investment_payments/:id (GET)
      # Usage: FundAmerica::Disbursement.details(disbursement_id)
      # Output: Returns the details of a distribution with matching id
      def details(disbursement_id)
        API::request(:get, "disbursements/#{disbursement_id}")
      end

      # End point: https://apps.fundamerica.com/api/investment_payments (POST)
      # Usage: FundAmerica::Disbursement.create(options)
      # Output: Creates a new entity - person or company
      def create(options)
        API::request(:post, 'disbursements', options)
      end
    end
  end
end
