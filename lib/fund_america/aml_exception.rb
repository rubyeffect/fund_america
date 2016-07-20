module FundAmerica
  class AmlException
    class << self

      # End point: https://apps.fundamerica.com/api/aml_exceptions (GET)
      # Usage: FundAmerica::AmlException.list
      # Output: Returns list of aml_exceptions
      def list
        API::request(:get, FundAmerica.base_uri + 'aml_exceptions')
      end

      # End point: https://apps.fundamerica.com/api/aml_exceptions/:id (GET)
      # Usage: FundAmerica::AmlException.details(aml_exception_id)
      # Output: Returns the details of an aml_exception with matching id
      def details(aml_exception_id)
        API::request(:get, FundAmerica.base_uri + "aml_exceptions/#{aml_exception_id}")
      end

      # End point: https://sandbox.fundamerica.com/api/test_mode/aml_exceptions/:id (PATCH)
      # Usage: FundAmerica::AmlException.update(aml_exception_id)
      # Output: Updates an aml exception in test mode
      # Important: This works only for Sandbox mode
      def update(aml_exception_id, options)
        API::request(:patch, FundAmerica.base_uri + "test_mode/aml_exceptions/#{aml_exception_id}", options)
      end

    end
  end
end
