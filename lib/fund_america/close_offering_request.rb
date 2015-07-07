module FundAmerica
  class CloseOfferingRequest
    class << self

      # End point: https://apps.fundamerica.com/api/close_offering_requests (GET)
      # Usage: FundAmerica::CloseOfferingRequest.list
      # Output: Returns list of close_offering_requests
      def list
        API::request(:get, FundAmerica.base_uri + 'close_offering_requests')
      end

      # End point: https://apps.fundamerica.com/api/close_offering_requests (POST)
      # Usage: FundAmerica::CloseOfferingRequest.create(options)
      # Output: Creates a new close_offering_request

      # TODO - Test creation of close offering once offering has reached goal
      def create(options)
        API::request(:post, FundAmerica.base_uri + 'close_offering_requests', options)
      end

      # End point: https://sandbox.fundamerica.com/api/test_mode/close_offering_requests/:id (PATCH)
      # Usage: FundAmerica::CloseOfferingRequest.update(close_offering_request_id, options)
      # Output: Updates a close_offering_request
      # Important: This works only for Sandbox mode
      def update(close_offering_request_id, options)
        end_point_url = 'https://sandbox.fundamerica.com/api/test_mode/close_offering_requests/' + close_offering_request_id
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/close_offering_requests/:id (GET)
      # Usage: FundAmerica::CloseOfferingRequest.details(close_offering_request_id)
      # Output: Returns the details of an close_offering_request with matching id
      def details(close_offering_request_id)
        API::request(:get, FundAmerica.base_uri + "close_offering_requests/#{close_offering_request_id}")
      end

    end
  end
end
