module FundAmerica
  class BankInfo
    class << self

      # End point: https://apps.fundamerica.com/api/bank_info/:routing_number (GET)
      # Usage: FundAmerica::BankInfo.info(routing_number)
      def info(routing_number)
        API::request(:get, "bank_info/#{routing_number}")
      end
    end
  end
end
