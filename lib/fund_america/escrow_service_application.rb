module FundAmerica
  class EscrowServiceApplication
    class << self

      # End point: https://apps.fundamerica.com/api/escrow_service_applications (GET)
      # Usage: FundAmerica::EscrowServiceApplication.list
      # Output: Returns list of escrow_service_applications
      def list
        API::request(:get, 'escrow_service_applications')
      end

      # End point: https://apps.fundamerica.com/api/escrow_service_applications (POST)
      # Usage: FundAmerica::EscrowServiceApplication.create(options)
      # Output: Creates a new escrow_service_application
      def create(options)
        API::request(:post, 'escrow_service_applications', options)
      end

      # End point: https://sandbox.fundamerica.com/api/test_mode/escrow_service_applications/:id (PATCH)
      # Usage: FundAmerica::EscrowServiceApplication.update(escrow_service_application_id, options)
      # Output: Updates the escrow service application with matching id
      # Important: Sandbox only method
      def update(escrow_service_application_id, options)
        API::request(:patch, "https://sandbox.fundamerica.com/api/test_mode/escrow_service_applications/#{escrow_service_application_id}", options)
      end

      # End point: https://apps.fundamerica.com/api/escrow_service_applications/:id (GET)
      # Usage: FundAmerica::EscrowServiceApplication.details(escrow_service_application_id)
      # Output: Returns the details of an escrow_service_application with matching id
      def details(escrow_service_application_id)
        API::request(:get, "escrow_service_applications/#{escrow_service_application_id}")
      end

    end
  end
end
