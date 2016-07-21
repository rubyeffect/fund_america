module FundAmerica
  class CustomerAgreement
    class << self

      # End point: https://apps.fundamerica.com/api/entities/:id/customer_agreement/edit (GET)
      # Usage: FundAmerica::CustomerAgreement.edit(entity_id)
      # Output: Returns the form details for the customer agreement
      def edit(entity_id)
        API::request(:get, "entities/#{entity_id}/customer_agreement/edit")
      end

      # End point: https://apps.fundamerica.com/api/entities/:id/customer_agreement (PATCH)
      # Usage: FundAmerica::CustomerAgreement.update(entity_id, options)
      # Output: Fill out the customer agreement
      def update(entity_id, options)
        API::request(:patch, "entities/#{entity_id}/customer_agreement", options)
      end

    end
  end
end
