module FundAmerica
  class Investment
    class << self

      # End point: https://apps.fundamerica.com/api/investments (GET)
      # Usage: FundAmerica::Investment.list
      # Output: Returns list of investments
      def list
        API::request(:get, 'investments')
      end

      # End point: https://apps.fundamerica.com/api/investments (POST)
      # Usage: FundAmerica::Investment.create(options)
      # Output: Creates a new investment
      def create(options)
        API::request(:post, 'investments', options)
      end

      # End point: https://apps.fundamerica.com/api/investments/:id (PATCH)
      # Usage: FundAmerica::Investment.update(investment_id, options)
      # Output: Updates an investment
      # In sandbox mode status can be updated to received using test_mode url
      def update(investment_id, options)
        end_point_url = FundAmerica.base_uri + "#{FundAmerica.mode == 'sandbox' ? 'test_mode/' : ''}" + "investments/#{investment_id}"
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/investments/:id (GET)
      # Usage: FundAmerica::Investment.details(investment_id)
      # Output: Returns the details of an investment with matching id
      def details(investment_id)
        API::request(:get, "investments/#{investment_id}")
      end

      # End point: https://apps.fundamerica.com/api/investments/:id (DELETE)
      # Usage: FundAmerica::Investment.delete(investment_id)
      # Output: Deletes an investment with matching id
      def delete(investment_id)
        API::request(:delete, "investments/#{investment_id}")
      end

      # End point: https://apps.fundamerica.com/api/investments/:id/billing_logs (GET)
      # Usage: FundAmerica::Investment.billing_logs(investment_id)
      # Output: Returns billing logs of an investment with matching id
      def billing_logs(investment_id)
        API::request(:get, "investments/#{investment_id}/billing_logs")
      end

      # End point: https://apps.fundamerica.com/api/investments/:id/investment_payments (GET)
      # Usage: FundAmerica::Investment.investment_payments(investment_id)
      # Output: Returns investment_payments of an investment with matching id
      def investment_payments(investment_id)
        API::request(:get, "investments/#{investment_id}/investment_payments")
      end

      # End point: https://apps.fundamerica.com/api/investments/:id/investor_payments (GET)
      # Usage: FundAmerica::Investment.investor_payments(investment_id)
      # Output: Returns investor_payments of an investment with matching id
      def investor_payments(investment_id)
        API::request(:get, "investments/#{investment_id}/investor_payments")
      end

    end
  end
end
