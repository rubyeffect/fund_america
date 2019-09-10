module FundAmerica
  class API
    class << self

      # This method is called from each end point method to make API requests
      # using HTTParty gem. Takes the method, uri and options as input
      # Handles response and errors
      def request(method, uri, options = {})
        options = FundAmerica.basic_auth.merge!(body: options)
        uri = FundAmerica.base_uri + uri unless uri.include?('test_mode')
        @response = HTTParty.send(method, uri, options)

        raise_wrong_status_error unless success_response

        parsed_response
      rescue JSON::ParserError
        nil
      rescue StandardError => e
        raise FundAmerica::Error.new(e, 503)
      end

      # End point: https://sandbox.fundamerica.com/api/test_mode/clear_data (POST)
      # Usage: FundAmerica::API.clear_data
      # Output: Clears all test data created in sandbox mode
      # Important: Sandbox mode only method
      def clear_data
        API::request(:post, 'https://sandbox.fundamerica.com/api/test_mode/clear_data')
      end

      # End point: https://apps.fundamerica.com/api/investorsuitabilitytokens (POST)
      # Usage: FundAmerica::API.investor_suitabilitytokens(options)
      def investor_suitabilitytokens(options)
        API::request(:post, 'investorsuitabilitytokens', options)
      end

      # End point: https://apps.fundamerica.com/api/ledger_entries/:id (GET)
      # Usage: FundAmerica::API.ledger_entry(ledger_entry_id)
      def ledger_entry(ledger_entry_id)
        API::request(:get, "ledger_entries/#{ledger_entry_id}")
      end

      private

      def success_response
        @response.code.to_i == 200
      end

      def parsed_response
        JSON.parse(@response.body)
      end

      def raise_wrong_status_error
        raise FundAmerica::Error.new(parsed_response, @response.code.to_i)
      end
    end
  end
end
