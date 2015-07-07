require 'spec_helper'

describe FundAmerica::BankInfo do
  context '#info' do
    before(:all) do
      @response = FundAmerica::BankInfo.info("122287251")
    end

    it 'must have name in response' do
      expect(@response['name']).not_to be nil
    end

    it 'must have address in response' do
      expect(@response['address']).not_to be nil
    end

    it 'must have same routing number as the one in request' do
      expect(@response['routing_number']).to eq("122287251")
    end
  end
end
