module FundAmerica
  class API
    class << self

      # This method is called from each end point method to make API requests
      # using HTTParty gem. Takes the method, uri and options as input
      # Handles response and errors
      def request method, uri, options={}
        options = FundAmerica.basic_auth.merge!({:body => options})
        response = HTTParty.send(method, uri, options)
        parsed_response = JSON.parse(response.body)
        if response.code.to_i == 200
          # Returns parsed_response - a hash of response body
          # if response is successful
          parsed_response
        else
          # Raises error if the response is not sucessful
          raise FundAmerica::Error.new(parsed_response, response.code.to_i)
        end
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
        API::request(:post, FundAmerica.base_uri + 'investorsuitabilitytokens', options)
      end

      # End point: https://apps.fundamerica.com/api/ledger_entries/:id (GET)
      # Usage: FundAmerica::API.ledger_entry(ledger_entry_id)
      def ledger_entry(ledger_entry_id)
        API::request(:get, FundAmerica.base_uri + "ledger_entries/#{ledger_entry_id}")
      end
    end
  end
end
