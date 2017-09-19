module FundAmerica
  class InvestorPayment
    class << self

      # End point: https://apps.fundamerica.com/api/investor_payments (GET)
      # Usage: FundAmerica::InvestorPayment.list
      # Output: Returns list of investor_payments
      def list
        API::request(:get, 'investor_payments')
      end

      # End point: https://apps.fundamerica.com/api/investor_payments/:id (GET)
      # Usage: FundAmerica::InvestorPayment.details(investor_payment_id)
      # Output: Returns the details of an investor_payment with matching id
      def details(investor_payment_id)
        API::request(:get, "investor_payments/#{investor_payment_id}")
      end

      # End point: https://apps.fundamerica.com/api/investor_payments (POST)
      # Usage: FundAmerica::InvestorPayment.create 
      # Output: Creates a new investor_payment
      def create(options = {})
        API::request(:post, 'investor_payments', options)
      end 

    end
  end
end
