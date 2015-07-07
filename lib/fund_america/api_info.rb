module FundAmerica
  class ApiInfo
    class << self

      # End point: https://apps.fundamerica.com/api/info (GET)
      # Usage: FundAmerica::ApiInfo.info
      # Output: Gives the account name, user name and api version details
      # Description: This method makes a call to request method
      # The API class request method is a common method that takes care of
      # making API request, handling response and errors
      def info
        API::request(:get, FundAmerica.base_uri + 'info')
      end
    end
  end
end
