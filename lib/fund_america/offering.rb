module FundAmerica
  class Offering
    class << self

      # End point: https://apps.fundamerica.com/api/offerings (GET)
      # Usage: FundAmerica::Offering.list
      # Output: Returns list of offerings
      def list
        API::request(:get, 'offerings')
      end

      # End point: https://apps.fundamerica.com/api/offerings (POST)
      # Usage: FundAmerica::Offering.create(options)
      # Output: Creates a new offering
      def create(options)
        API::request(:post, 'offerings', options)
      end

      # End point: https://apps.fundamerica.com/api/offerings/:id (PATCH)
      # Usage: FundAmerica::Offering.update(offering_id, options)
      # Output: Updates an offering
      # In sandbox mode accept_investments can only be updated
      def update(offering_id, options)
        end_point_url = FundAmerica.base_uri + "#{FundAmerica.mode == 'sandbox' ? 'test_mode/' : ''}" + "offerings/#{offering_id}"
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/offerings/:id (GET)
      # Usage: FundAmerica::Offering.details(offering_id)
      # Output: Returns the details of an offering with matching id
      def details(offering_id)
        API::request(:get, "offerings/#{offering_id}")
      end

      # End point: https://apps.fundamerica.com/api/offerings/:id (DELETE)
      # Usage: FundAmerica::Offering.delete(offering_id)
      # Output: Deletes an offering with matching id
      def delete(offering_id)
        API::request(:delete, "offerings/#{offering_id}")
      end

      # End point: https://apps.fundamerica.com/api/offerings/:id/billing_logs (GET)
      # Usage: FundAmerica::Offering.billing_logs(offering_id)
      # Output: Returns billing logs of an offering with matching id
      def billing_logs(offering_id)
        API::request(:get, "offerings/#{offering_id}/billing_logs")
      end

      # End point: https://apps.fundamerica.com/api/offerings/:id/escrow_ledger (GET)
      # Usage: FundAmerica::Offering.escrow_ledger(offering_id)
      # Output: Returns escrow_ledger of an offering with matching id
      def escrow_ledger(offering_id)
        API::request(:get, "offerings/#{offering_id}/escrow_ledger")
      end

      # End point: https://apps.fundamerica.com/api/offerings/:id/investment_payments (GET)
      # Usage: FundAmerica::Offering.investment_payments(offering_id)
      # Output: Returns investment_payments of an offering with matching id
      def investment_payments(offering_id)
        API::request(:get, "offerings/#{offering_id}/investment_payments")
      end

    end
  end
end
