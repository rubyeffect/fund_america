module FundAmerica
  class ElectronicSignature
    class << self

      # End point: https://apps.fundamerica.com/api/electronic_signatures/:id (GET)
      # Usage: FundAmerica::ElectronicSignature.details(electronic_signature_id)
      # Output: Returns details of electronic_signature with matching id
      def details(electronic_signature_id)
        API::request(:get, FundAmerica.base_uri + "electronic_signatures/#{electronic_signature_id}")
      end

      # End point: https://apps.fundamerica.com/api/electronic_signatures/:id (PATCH)
      # Usage: FundAmerica::ElectronicSignature.update(electronic_signature_id, options)
      # Output: Updates an electronic_signature
      def update(electronic_signature_id, options)
        API::request(:patch, FundAmerica.base_uri + "electronic_signatures/#{electronic_signature_id}", options)
      end

    end
  end
end
