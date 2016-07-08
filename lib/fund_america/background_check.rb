module FundAmerica
  class BackgroundCheck
    class << self

      # End point: https://apps.fundamerica.com/api/background_checks (GET)
      # Usage: FundAmerica::BackgroundCheck.list
      # Output: Returns list of background_checks
      def list
        API::request(:get, 'background_checks')
      end

      # End point: https://apps.fundamerica.com/api/background_checks (POST)
      # Usage: FundAmerica::BackgroundCheck.create(options)
      # Output: Creates a new background_check
      def create(options)
        API::request(:post, 'background_checks', options)
      end

      # End point: https://apps.fundamerica.com/api/background_checks/:id (GET)
      # Usage: FundAmerica::BackgroundCheck.details(background_check_id)
      # Output: Returns the details of an background_check with matching id
      def details(background_check_id)
        API::request(:get, "background_checks/#{background_check_id}")
      end

    end
  end
end
