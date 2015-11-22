module FundAmerica
  class EmailLog
    class << self

      # End point: https://apps.fundamerica.com/api/email_logs (GET)
      # Usage: FundAmerica::EmailLog.list
      # Output: Returns list of email_logs
      def list
        API::request(:get, FundAmerica.base_uri + 'email_logs')
      end

      # End point: https://apps.fundamerica.com/api/email_logs/:id (GET)
      # Usage: FundAmerica::EmailLog.details(email_log_id)
      # Output: Returns the details of an email_log with matching id
      def details(email_log_id)
        API::request(:get, FundAmerica.base_uri + "email_logs/#{email_log_id}")
      end

    end
  end
end
