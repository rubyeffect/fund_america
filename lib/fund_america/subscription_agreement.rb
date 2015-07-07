module FundAmerica
  class SubscriptionAgreement
    class << self

      # End point: https://apps.fundamerica.com/api/subscription_agreements (GET)
      # Usage: FundAmerica::SubscriptionAgreement.list
      # Output: Returns list of subscription_agreements
      def list
        API::request(:get, FundAmerica.base_uri + 'subscription_agreements')
      end

      # End point: https://apps.fundamerica.com/api/subscription_agreements (POST)
      # Usage: FundAmerica::SubscriptionAgreement.create(options)
      # Output: Creates a new subscription_agreement
      def create(options)
        API::request(:post, FundAmerica.base_uri + 'subscription_agreements', options)
      end

      # End point: https://apps.fundamerica.com/api/subscription_agreements/:id (GET)
      # Usage: FundAmerica::SubscriptionAgreement.details(subscription_agreement_id)
      # Output: Returns the details of an subscription_agreement with matching id
      def details(subscription_agreement_id)
        API::request(:get, FundAmerica.base_uri + "subscription_agreements/#{subscription_agreement_id}")
      end

    end
  end
end
