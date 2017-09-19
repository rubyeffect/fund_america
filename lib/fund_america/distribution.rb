module FundAmerica
  class Distribution
    class << self

      # End point: https://apps.fundamerica.com/api/distributions (GET)
      # Usage: FundAmerica::Distribution.list
      # Output: Returns list of distributions
      def list
        API::request(:get, 'distributions')
      end

      # End point: https://apps.fundamerica.com/api/investment_payments/:id (GET)
      # Usage: FundAmerica::Distribution.details(distribution_id)
      # Output: Returns the details of a distribution with matching id
      def details(distribution_id)
        API::request(:get, "distributions/#{distribution_id}")
      end

      # End point: https://apps/fundamerica.com/api/distributions/:id/investor_payments
      # Usage: FundAmerica::Distribution.investor_payments(distribution_id)
      # Output: Returns the investor_payments associated with distribution
      def investor_payments(distribution_id, options = {})
      	API::request(:get, "distributions/#{distribution_id}/investor_payments", options)
      end

      # End point: https://apps/fundamerica.com/api/distributions/:id/non_investor_payments
      # Usage: FundAmerica::Distribution.non_investor_payments(distribution_id)
      # Output: Returns the non_investor_payments associated with distribution
      def non_investor_payments(distribution_id, options = {})
        API::request(:get, "distributions/#{distribution_id}/non_investor_payments", options)
      end

      # End point: https://apps.fundamerica.com/api/distribution
      # Usage:     FundAmerica::Distribution.create(options)
      # Output:    Returns distribution attributes
      def create(options = {})
        API::request(:post, 'distributions', options)
      end

    end
  end
end


