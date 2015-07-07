require 'spec_helper'

describe FundAmerica do
  it 'has a version number' do
    expect(FundAmerica::VERSION).not_to be nil
  end

  it 'has an api key' do
    expect(FundAmerica.api_key).not_to be nil
  end

  it 'has a mode' do
    expect(FundAmerica.mode).not_to be nil
  end

  it 'must have default mode as sandbox' do
    expect(FundAmerica.mode).to eq('sandbox')
  end

  it 'must not have default mode as production' do
    expect(FundAmerica.mode).not_to eq('production')
  end

  it 'must have mode as sandbox when mode is set to sandbox' do
    FundAmerica.mode = 'sandbox'
    expect(FundAmerica.mode).to eq('sandbox')
  end

  it 'must not have mode as production when mode is set to sandbox' do
    FundAmerica.mode = 'sandbox'
    expect(FundAmerica.mode).not_to eq('production')
  end

  it 'must have mode as production when mode is set to production' do
    FundAmerica.mode = 'production'
    expect(FundAmerica.mode).to eq('production')
  end

  it 'must not have mode as sandbox when mode is set to production' do
    FundAmerica.mode = 'production'
    expect(FundAmerica.mode).not_to eq('sandbox')
  end

  it 'has a base_uri' do
    expect(FundAmerica.base_uri).not_to be nil
  end

  it 'must have sandbox base uri if mode is not set' do
    FundAmerica.mode = nil
    expect(FundAmerica.base_uri).to eq('https://sandbox.fundamerica.com/api/')
  end

  it 'must have sandbox base uri if mode is set to sandbox' do
    FundAmerica.mode = 'sandbox'
    expect(FundAmerica.base_uri).to eq('https://sandbox.fundamerica.com/api/')
  end

  it 'must not have production base uri if mode is set to sandbox' do
    FundAmerica.mode = 'sandbox'
    expect(FundAmerica.base_uri).not_to eq('https://apps.fundamerica.com/api/')
  end

  it 'must have production base uri if mode is set to production' do
    FundAmerica.mode = 'production'
    expect(FundAmerica.base_uri).to eq('https://apps.fundamerica.com/api/')
  end

  it 'must not have sandbox base uri if mode is set to production' do
    FundAmerica.mode = 'production'
    expect(FundAmerica.base_uri).not_to eq('https://sandbox.fundamerica.com/api/')
  end

  it 'must have a #basic_auth' do
    expect(FundAmerica.basic_auth).not_to be nil
  end

  it 'must have a hash for #basic_auth' do
    expect(FundAmerica.basic_auth).to be_a_kind_of(Hash)
  end

  it 'must have a key called :basic_auth for #basic_auth' do
    expect(FundAmerica.basic_auth).to include(:basic_auth)
  end

  it 'must have a key called :basic_auth with value as a hash for #basic_auth' do
    expect(FundAmerica.basic_auth).to include({:basic_auth => be_a_kind_of(Hash)})
  end
end
