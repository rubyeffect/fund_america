require 'httparty'
require 'json'
require 'fund_america/all'

module FundAmerica
  class << self
    def api_key
      return ENV['FUND_AMERICA_API_KEY'] if ENV['FUND_AMERICA_API_KEY']

      raise FundAmerica::Error.new('FundAmerica.api_key not configured', nil)
    end

    def mode
      ENV['FUND_AMERICA_ENVIRONMENT'] || 'sandbox'
    end

    def base_uri
      sandbox? ? sandbox_base_uri : live_base_uri
    end

    def basic_auth
      { basic_auth: { username: api_key } }
    end

    private

    def sandbox?
      mode == 'sandbox'
    end

    def sandbox_base_uri
      'https://sandbox.fundamerica.com/api/'
    end

    def live_base_uri
      'https://apps.fundamerica.com/api/'
    end
  end
end
