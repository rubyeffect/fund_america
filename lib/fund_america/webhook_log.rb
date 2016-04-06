module FundAmerica
  class WebhookLog
    class << self

      # End point: https://apps.fundamerica.com/api/webhook_logs/?page=[num]&per=[num] (GET)
      # Usage: FundAmerica::WebhookLog.list
      # Output: Returns list of webhook_logs
      # Params: (method defaults are the same as the current API defaults)
      #  * page - page number of results; starts at 1, not 0
      #  * per - number of results per page
      def list(page: 1, per: 25)
        request_uri = "/?page=#{page}&per=#{per}" if page
        API::request(:get, request_uri)
      end

      # End point: https://apps.fundamerica.com/api/webhook_logs/:id (GET)
      # Usage: FundAmerica::WebhookLog.details(webhook_log_id)
      # Output: Returns the details of an webhook_log with matching id
      def details(webhook_log_id)
        API::request(:get, "webhook_logs/#{webhook_log_id}")
      end

    end
  end
end
