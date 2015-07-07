require 'spec_helper'

describe FundAmerica::BillingLog do
  context '#list' do
    before(:all) do
      @response = FundAmerica::BillingLog.list
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

# TODO - When this request is run, the response is being given as 500
# Contact FundAmerica regarding it
=begin
    context '#details' do
      before(:all) do
        @first_bl = @response['resources'].first
        @billing_log = FundAmerica::BillingLog.details(@first_bl['id']) unless @first_bl.nil?
      end

      it 'must have a response' do
        unless @first_bl.nil?
          expect(@billing_log).not_to be nil
        end
      end

      it 'must have matching id as in request' do
        unless @first_bl.nil?
          expect(@billing_log['id']).to eq(@first_bl['id'])
        end
      end
    end
=end
  end
end
