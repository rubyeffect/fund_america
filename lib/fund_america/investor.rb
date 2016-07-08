module FundAmerica
  class Investor
    class << self

      # End point: https://apps.fundamerica.com/api/investors (GET)
      # Usage: FundAmerica::Investor.list
      # Output: Returns list of investors
      def list
        API::request(:get, 'investors')
      end

      # End point: https://apps.fundamerica.com/api/investors (POST)
      # Usage: FundAmerica::Investor.create(options)
      # Output: Creates a new investor - proxy, joint, ira
      def create(options)
        API::request(:post, 'investors', options)
      end

      # End point: https://apps.fundamerica.com/api/investors/:id (PATCH)
      # Usage: FundAmerica::Investor.update(entity_id, options)
      # Output: Updates an investor - proxy, joint, irc
      # Uses test_mode update when used in sandbox mode
      def update(investor_id, options)
        end_point_url = FundAmerica.base_uri + "#{FundAmerica.mode == 'sandbox' ? 'test_mode/' : ''}" + "investors/#{investor_id}"
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/entities/:id (GET)
      # Usage: FundAmerica::Investor.details(entity_id)
      # Output: Returns the details of an investor with matching id
      def details(investor_id)
        API::request(:get, "investors/#{investor_id}")
      end
    end
  end
end
