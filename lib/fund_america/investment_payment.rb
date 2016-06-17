module FundAmerica
  class InvestmentPayment
    class << self

      # End point: https://apps.fundamerica.com/api/investment_payments (GET)
      # Usage: FundAmerica::InvestmentPayment.list
      # Output: Returns list of investment_payments
      def list
        API::request(:get, 'investment_payments')
      end

      # End point: https://apps.fundamerica.com/api/investment_payments/:id (GET)
      # Usage: FundAmerica::InvestmentPayment.details(investment_payment_id)
      # Output: Returns the details of an investment_payment with matching id
      def details(investment_payment_id)
        API::request(:get, "investment_payments/#{investment_payment_id}")
      end

    end
  end
end
