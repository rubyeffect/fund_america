module FundAmerica
  class InvestorPaymentMethod
    class << self

      # End point: https://apps.fundamerica.com/api/investor_payment_method (GET)
      # Usage: FundAmerica::InvestorPaymentMethod.list
      # Output: Returns list of investor_payment_methods
      def list(options = {})
        API::request(:get, 'investor_payment_method', options)
      end

      # End point: https://apps.fundamerica.com/api/investor_payment_method (POST)
      # Usage: FundAmerica::InvestorPaymentMethod.list
      # Output: Creates investor_payment_method
      def create(options = {})
      	API::request(:post, 'investor_payment_method', options)
      end 

      # End point: https://apps.fundamerica.com/api/investor_payment_method/:id (PATCH)
      # Usage: FundAmerica::InvestorPaymentMethod.update
      # Output: Updates investor_payment_method
      def update(investor_payment_method_id, options = {})
      	API::request(:post, 'investor_payment_method', options)
      end 

      # End point: https://apps.fundamerica.com/api/investor_payment_method/:id (GET)
      # Usage: FundAmerica::InvestorPaymentMethod.details
      # Output: Returns investor_payment_method
      def details(investor_payment_method_id, options = {})
      	API::request(:get, 'investor_payment_method', options)
      end 

    end 
   end
 end
