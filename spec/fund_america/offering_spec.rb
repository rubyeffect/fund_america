require 'spec_helper'

describe FundAmerica::Offering do
  context '#list' do
    before(:all) do
      @response = FundAmerica::Offering.list
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

  context '#create' do
    before(:all) do
      t = Time.now.to_i
      options = {
        :city => 'Las Vegas',
        :country => 'US',
        :email => "test#{t}@test.com",
        :name => "Test U#{t}",
        :phone => '1234567890',
        :postal_code => '89123',
        :region => 'NV',
        :street_address_1 => '123 street',
        :tax_id_number => '123123123',
        :type => "person",
        :date_of_birth => '1980-01-01'
      }
      @entity = FundAmerica::Entity.create(options)
      offering_options = {
        :amount => '5000000',
        :description => 'A really big deal.',
        :max_amount => '5500000',
        :min_amount => '4500000',
        :name => "Offering #{t}",
        :entity_id => @entity['id']
      }
      @offering = FundAmerica::Offering.create(offering_options)
    end

    it 'must have a response' do
      expect(@offering).not_to be nil
    end

    it 'must have an id' do
      expect(@offering['id']).not_to be nil
    end

    it 'must have object as offering' do
      expect(@offering['object']).to eq('offering')
    end

    context '#details' do
      before(:all) do
        @offering_details = FundAmerica::Offering.details(@offering['id'])
      end

      it 'must have a response' do
        expect(@offering_details).not_to be nil
      end

      it 'must have an id' do
        expect(@offering_details['id']).not_to be nil
      end

      it 'must match the id in the request' do
        expect(@offering_details['id']).to eq(@offering['id'])
      end
    end

    context '#update' do
      before(:all) do
        @offering_updated = FundAmerica::Offering.update(@offering['id'], {:accept_investments => true})
      end

      it 'must have a response' do
        expect(@offering_updated).not_to be nil
      end

      it 'must have an id' do
        expect(@offering_updated['id']).not_to be nil
      end

      it 'must match the id in the request' do
        expect(@offering_updated['id']).to eq(@offering['id'])
      end

      it 'must show the updated value in response' do
        expect(@offering_updated['accept_investments']).to be true
      end
    end

    context '#billing_logs' do
      before(:all) do
        @billing_logs = FundAmerica::Offering.billing_logs(@offering['id'])
      end

      it 'must have object in response' do
        expect(@billing_logs['object']).not_to be nil
      end

      it 'must have object as resource_list' do
        expect(@billing_logs['object']).to eq('resource_list')
      end

      it 'must have total_resources in response' do
        expect(@billing_logs['total_resources']).not_to be nil
      end

      it 'must have total_resources as 0 or more' do
        expect(@billing_logs['total_resources']).to be >= 0
      end

      it 'must have page in response' do
        expect(@billing_logs['page']).not_to be nil
      end

      it 'must have page as 1 or more' do
        expect(@billing_logs['page']).to be >= 1
      end

      it 'must have per in response' do
        expect(@billing_logs['per']).not_to be nil
      end

      it 'must have more in response' do
        expect(@billing_logs['more']).not_to be nil
      end

      it 'must have more as boolean value' do
        expect(@billing_logs['more']).to be_boolean
      end

      it 'must have resources in response' do
        expect(@billing_logs['resources']).not_to be nil
      end

      it 'must have resources as array' do
        expect(@billing_logs['resources']).to be_instance_of(Array)
      end
    end

    context '#investment_payments' do
      before(:all) do
        @investment_payments = FundAmerica::Offering.investment_payments(@offering['id'])
      end

      it 'must have object in response' do
        expect(@investment_payments['object']).not_to be nil
      end

      it 'must have object as resource_list' do
        expect(@investment_payments['object']).to eq('resource_list')
      end

      it 'must have total_resources in response' do
        expect(@investment_payments['total_resources']).not_to be nil
      end

      it 'must have total_resources as 0 or more' do
        expect(@investment_payments['total_resources']).to be >= 0
      end

      it 'must have page in response' do
        expect(@investment_payments['page']).not_to be nil
      end

      it 'must have page as 1 or more' do
        expect(@investment_payments['page']).to be >= 1
      end

      it 'must have per in response' do
        expect(@investment_payments['per']).not_to be nil
      end

      it 'must have more in response' do
        expect(@investment_payments['more']).not_to be nil
      end

      it 'must have more as boolean value' do
        expect(@investment_payments['more']).to be_boolean
      end

      it 'must have resources in response' do
        expect(@investment_payments['resources']).not_to be nil
      end

      it 'must have resources as array' do
        expect(@investment_payments['resources']).to be_instance_of(Array)
      end
    end
  end
end
