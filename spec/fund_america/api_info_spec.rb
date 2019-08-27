require 'spec_helper'

describe FundAmerica::ApiInfo, :vcr do
  context '#info' do
    let(:response) { FundAmerica::ApiInfo.info }

    it 'return proper account_name' do
      expect(response['account_name']).to eq('BnkToTheFuture')
    end

    it 'return proper user_name' do
      expect(response['user_name']).to eq('API User')
    end

    it 'return api_version' do
      expect(response['api_version']).not_to be_nil
    end
  end
end
