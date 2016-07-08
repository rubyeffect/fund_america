module FundAmerica
  class BillingLog
    class << self

      # End point: https://apps.fundamerica.com/api/billing_logs (GET)
      # Usage: FundAmerica::BillingLog.list
      # Output: Returns list of billing_logs
      def list
        API::request(:get, 'billing_logs')
      end

      # End point: https://apps.fundamerica.com/api/billing_logs/:id (GET)
      # Usage: FundAmerica::BillingLog.details(billing_log_id)
      # Output: Returns the details of an billing_log with matching id
      def details(billing_log_id)
        API::request(:get, "billing_logs/#{billing_log_id}")
      end

    end
  end
end
