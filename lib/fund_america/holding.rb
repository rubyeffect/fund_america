module FundAmerica
  class Holding
    class << self

      # End point: https://apps.fundamerica.com/api/holdings
      # Usage: FundAmerica::Holding.list
      # Output: Returns list of holdings
      def list
        API::request(:get, FundAmerica.base_uri + 'holdings')
      end

      # End point: https://apps.fundamerica.com/api/holdings/:id (GET)
      # Usage: FundAmerica::Holding.details(Holding_id)
      # Output: Returns the details of a Holding with matching id
      def details(holding_id)
        API::request(:get, FundAmerica.base_uri + "holdings/#{holding_id}")
      end

    end
  end
end