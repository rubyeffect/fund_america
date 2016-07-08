module FundAmerica
  class SubscriptionAgreementTemplate
    class << self

      # End point: https://apps.fundamerica.com/api/subscription_agreement_templates (GET)
      # Usage: FundAmerica::SubscriptionAgreementTemplate.list
      # Output: Returns list of subscription_agreement_templates
      def list
        API::request(:get, 'subscription_agreement_templates')
      end

      # End point: https://apps.fundamerica.com/api/subscription_agreement_templates (POST)
      # Usage: FundAmerica::SubscriptionAgreementTemplate.create(options)
      # Output: Creates a new subscription_agreement_template
      def create(options)
        API::request(:post, 'subscription_agreement_templates', options)
      end

      # End point: https://apps.fundamerica.com/api/subscription_agreement_templates/:id (PATCH)
      # Usage: FundAmerica::SubscriptionAgreementTemplate.update(subscription_agreement_template_id, options)
      # Output: Updates an subscription_agreement_template
      def update(subscription_agreement_template_id, options)
        API::request(:patch, "subscription_agreement_templates/#{subscription_agreement_template_id}", options)
      end

      # End point: https://apps.fundamerica.com/api/subscription_agreement_templates/:id (GET)
      # Usage: FundAmerica::SubscriptionAgreementTemplate.details(subscription_agreement_template_id)
      # Output: Returns the details of an subscription_agreement_template with matching id
      def details(subscription_agreement_template_id)
        API::request(:get, "subscription_agreement_templates/#{subscription_agreement_template_id}")
      end

      # End point: https://apps.fundamerica.com/api/subscription_agreement_templates/:id (DELETE)
      # Usage: FundAmerica::SubscriptionAgreementTemplate.delete(subscription_agreement_template_id)
      # Output: Deletes an subscription_agreement_template with matching id
      def delete(subscription_agreement_template_id)
        API::request(:delete, "subscription_agreement_templates/#{subscription_agreement_template_id}")
      end

      # Endpoint: https://apps.fundamerica.com/api/subscription_agreement_templates/boilerplate_html (GET)
      # Usage: FundAmerica::SubscriptionAgreementTemplate.boilerplate_html
      # Output: Returns boiler plate html
      def boilerplate_html
        API::request(:get, 'subscription_agreement_templates/boilerplate_html')
      end

    end
  end
end
