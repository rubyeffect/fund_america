require 'spec_helper'

describe FundAmerica do
  let(:fund_america_api_key) { ENV['FUND_AMERICA_API_KEY'] }
  let(:fund_america_mode_key) { nil }

  before do
    allow(ENV).to receive(:[]).with('FUND_AMERICA_API_KEY').and_return(fund_america_api_key)
    allow(ENV).to receive(:[]).with('FUND_AMERICA_ENVIRONMENT').and_return(fund_america_mode_key)
  end

  it 'has a version number' do
    expect(FundAmerica::VERSION).not_to be nil
  end

  describe '#api_key' do
    context 'when env FUND_AMERICA_API_KEY is not defined' do
      let(:fund_america_api_key) { nil }

      it 'raises error' do
        error = /FundAmerica.api_key not configured/
        expect { FundAmerica.api_key }.to raise_error(FundAmerica::Error, error)
      end
    end

    context 'when env FUND_AMERICA_API_KEY is defined' do
      it 'returns api key' do
        expect(FundAmerica.api_key).to eq(fund_america_api_key)
      end
    end
  end

  describe '#mode' do
    context 'when env FUND_AMERICA_ENVIRONMENT is not defined' do
      it 'sets mode to sandbox' do
        expect(FundAmerica.mode).to eq('sandbox')
      end
    end

    context 'when env FUND_AMERICA_ENVIRONMENT is defined' do
      let(:fund_america_mode_key) { 'production' }

      it 'sets mode to to key' do
        expect(FundAmerica.mode).to eq(fund_america_mode_key)
      end
    end
  end

  describe '#base_uri' do
    context 'when mode is sandbox' do
      it 'returns sandbox uri' do
        expect(FundAmerica.base_uri).to eq('https://sandbox.fundamerica.com/api/')
      end
    end

    context 'when mode is production' do
      let(:fund_america_mode_key) { 'production' }

      it 'returns production uri' do
        expect(FundAmerica.base_uri).to eq('https://apps.fundamerica.com/api/')
      end
    end
  end

  describe '#basic_auth' do
    it 'returns hash object' do
      expect(FundAmerica.basic_auth).to be_a_kind_of(Hash)
    end

    it 'must have a key called :basic_auth' do
      expect(FundAmerica.basic_auth).to include(:basic_auth)
    end

    it 'must have a key called :basic_auth with value as a hash' do
      expect(FundAmerica.basic_auth[:basic_auth]).to be_a_kind_of(Hash)
    end
  end
end
