require 'spec_helper'

describe FundAmerica::API do
  context '#clear_data' do
    it 'must have a response' do
      expect(FundAmerica::API.clear_data).not_to be nil
    end
  end
end
