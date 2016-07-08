module FundAmerica
  class BankTransferMethod
    class << self

      # End point: https://apps.fundamerica.com/api/bank_transfer_methods/:id (GET)
      # Usage: FundAmerica::BankTransferMethod.details(bank_transfer_method_id)
      # Output: Returns the details of a bank transfer method with matching id
      def details(bank_transfer_method_id)
        API::request(:get, "bank_transfer_methods/#{bank_transfer_method_id}")
      end
    end
  end
end
