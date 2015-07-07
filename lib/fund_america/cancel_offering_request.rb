module FundAmerica
  class CancelOfferingRequest
    class << self

      # End point: https://apps.fundamerica.com/api/cancel_offering_requests (GET)
      # Usage: FundAmerica::CancelOfferingRequest.list
      # Output: Returns list of cancel_offering_requests
      def list
        API::request(:get, FundAmerica.base_uri + 'cancel_offering_requests')
      end

      # End point: https://apps.fundamerica.com/api/cancel_offering_requests (POST)
      # Usage: FundAmerica::CancelOfferingRequest.create(options)
      # Output: Creates a new cancel_offering_request
      def create(options)
        API::request(:post, FundAmerica.base_uri + 'cancel_offering_requests', options)
      end

      # End point: https://sandbox.fundamerica.com/api/test_mode/cancel_offering_requests/:id (PATCH)
      # Usage: FundAmerica::CancelOfferingRequest.update(cancel_offering_request_id, options)
      # Output: Updates a cancel_offering_request
      # Important: This works only for Sandbox mode
      def update(cancel_offering_request_id, options)
        end_point_url = 'https://sandbox.fundamerica.com/api/test_mode/cancel_offering_requests/' + cancel_offering_request_id
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/cancel_offering_requests/:id (GET)
      # Usage: FundAmerica::CancelOfferingRequest.details(cancel_offering_request_id)
      # Output: Returns the details of an cancel_offering_request with matching id
      def details(cancel_offering_request_id)
        API::request(:get, FundAmerica.base_uri + "cancel_offering_requests/#{cancel_offering_request_id}")
      end

    end
  end
end
