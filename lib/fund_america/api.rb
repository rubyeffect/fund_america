module FundAmerica
  class API
    class << self

      # This method is called from each end point method to make API requests
      # using HTTParty gem. Takes the method, uri and options as input
      # Handles response and errors
      def request method, uri, options={}
        options = FundAmerica.basic_auth.merge!({:body => options})
        uri = FundAmerica.base_uri + uri unless uri.include?('test_mode')
        response = HTTParty.send(method, uri, options)
        # response = HTTParty.send(method, 'https://sandbox.fundamerica.com/500', options)
        begin
          parsed_response = JSON.parse(response.body)

          if response.code.to_i == 200
            # Returns parsed_response - a hash of response body
            # if response is successful
            parsed_response
          else
            # Raises error if the response is not sucessful
            raise FundAmerica::Error.new(parsed_response, response.code.to_i)
          end
        rescue JSON::ParserError => e
          if response.body.include?('An unexpected error has occurred.') || response.body.include?('went wrong') ||
             response.body.include?('Internal Server Error')

            raise FundAmerica::Error.new('An unexpected error has occurred on the Fund America side.', 500)
          elsif response.body.include?('unavailable')
            raise FundAmerica::Error.new('Sorry, escrow provider is current unavailable. Please try later.', 426)
          elsif response.body.include?('Page Not Found')
            raise FundAmerica::Error.new('Page Not Found on the Fund America side.', 404)
          elsif response.body.include?('Not Allowed')
            raise FundAmerica::Error.new('Not Allowed error on the Fund America side.', 405)
          else
            raise FundAmerica::Error.new(e, 500)
          end
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
        API::request(:post, 'investorsuitabilitytokens', options)
      end

      # End point: https://apps.fundamerica.com/api/ledger_entries/:id (GET)
      # Usage: FundAmerica::API.ledger_entry(ledger_entry_id)
      def ledger_entry(ledger_entry_id)
        API::request(:get, "ledger_entries/#{ledger_entry_id}")
      end
    end
  end
end
