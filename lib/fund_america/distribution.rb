module FundAmerica
  class Distribution
    class << self

      # End point: https://apps.fundamerica.com/api/distributions (GET)
      # Usage: FundAmerica::Distribution.list
      # Output: Returns list of distributions
      def list
        API::request(:get, FundAmerica.base_uri + 'distributions')
      end

      # End point: https://apps.fundamerica.com/api/investment_payments/:id (GET)
      # Usage: FundAmerica::Distribution.details(distribution_id)
      # Output: Returns the details of a distribution with matching id
      def details(distribution_id)
        API::request(:get, FundAmerica.base_uri + "distributions/#{distribution_id}")
      end

      # End point: https://apps/fundamerica.com/api/distributions/:id/investor_payments
      # Usage: FundAmerica::Distribution.investor_payments(distribution_id)
      # Output: Returns the investor_payments associated with distribution
      def investor_payments(distribution_id)
      	API::request(:get, FundAmerica.base_uri + "distributions/#{distribution_id}/investor_payments")
      end

    end
  end
end