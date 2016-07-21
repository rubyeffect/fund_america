require 'spec_helper'

describe FundAmerica::AmlException do
  context '#list' do
    before(:all) do
      @response = FundAmerica::AmlException.list
    end

    it 'must have object in response' do
      expect(@response['object']).not_to be nil
    end

    it 'must have object as resource_list' do
      expect(@response['object']).to eq('resource_list')
    end

    it 'must have total_resources in response' do
      expect(@response['total_resources']).not_to be nil
    end

    it 'must have total_resources as 0 or more' do
      expect(@response['total_resources']).to be >= 0
    end

    it 'must have page in response' do
      expect(@response['page']).not_to be nil
    end

    it 'must have page as 1 or more' do
      expect(@response['page']).to be >= 1
    end

    it 'must have per in response' do
      expect(@response['per']).not_to be nil
    end

    it 'must have more in response' do
      expect(@response['more']).not_to be nil
    end

    it 'must have more as boolean value' do
      expect(@response['more']).to be_boolean
    end

    it 'must have resources in response' do
      expect(@response['resources']).not_to be nil
    end

    it 'must have resources as array' do
      expect(@response['resources']).to be_instance_of(Array)
    end
  end

  # TODO i can't find a way to create an aml exception in test mode in order to test this
  # context '#details' do
  #   before(:all) do
  #     @aml_exception = FundAmerica::AmlException.update("yXlIZxuXRj2mkCgrxWtSRw", { 
  #       status: "contact_issuer", 
  #       documentation_required: "true"
  #     })
  #     @aml_e = FundAmerica::AmlException.details(@aml_exception['id'])
  #   end

  #   it 'must return a response' do
  #     expect(@aml_e).not_to be nil
  #   end

  #   it 'must have an id' do
  #     expect(@aml_e['id']).not_to be nil
  #   end

  #   it 'must return the id same as the one sent in request' do
  #     expect(@aml_e['id']).to eq(@aml_exception['id'])
  #   end
  # end
end
