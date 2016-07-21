require 'httparty'
require 'json'
require 'fund_america/all'

module FundAmerica
  class << self
    # Returns API key or raises exception
    def api_key
      defined? @api_key and @api_key or raise "FundAmerica.api_key not configured"
    end
    attr_writer :api_key

    # Returns mode and if mode is not set, it takes sandbox as mode
    # Mode is either sandbox or production
    def mode
      defined? @mode and @mode or @mode='sandbox'
    end
    attr_writer :mode

    # Sets the API endpoint based on mode
    # The base uri here has the common url part in end points
    # For each API request, the request specific element must be added
    # An example for entities is: base_uri + 'entities'
    def base_uri
      if mode == 'sandbox'
        @base_uri = 'https://sandbox.fundamerica.com/api/'
      else
        @base_uri = 'https://apps.fundamerica.com/api/'
      end
    end

    # Returns basic authentication hash
    # While making a request, merge this hash into options hash of request
    # Request specific hash has to be merged into this hash with key as body
    # The options hash would look like
    # {:basic_auth => {:username => 'someapikey'}}, :body => request_specific_options_hash}
    def basic_auth
      {
        :basic_auth => {
          :username => api_key
        }
      }
    end
  end
end
