require 'spec_helper'

describe FundAmerica::ApiInfo do
  context '#info' do
    before(:all) do
      @response = FundAmerica::ApiInfo.info
    end

    it 'must have account_name in response' do
      expect(@response['account_name']).not_to be nil
    end

    it 'must have user_name in response' do
      expect(@response['user_name']).not_to be nil
    end

    it 'must have api_version in response' do
      expect(@response['api_version']).not_to be nil
    end
  end
end
