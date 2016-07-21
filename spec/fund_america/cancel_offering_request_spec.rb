require 'spec_helper'

describe FundAmerica::CancelOfferingRequest do
  context '#list' do
    before(:all) do
      @response = FundAmerica::CancelOfferingRequest.list
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
        :phone => '12025551212',
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
      FundAmerica::Offering.update(@offering['id'], {:accept_investments => true })
      co_options = {
        :offering_id => @offering['id'],
        :comment => 'Test comment'
      }
      @co_request = FundAmerica::CancelOfferingRequest.create(co_options)
    end

    it 'must have a response' do
      expect(@co_request).not_to be nil
    end

    it 'must have an id' do
      expect(@co_request).to include 'id'
    end

    it 'must have object as cancel_offering_request' do
      expect(@co_request['object']).to eq('cancel_offering_request')
    end

    context '#details' do
      before(:all) do
        @cor_details = FundAmerica::CancelOfferingRequest.details(@co_request['id'])
      end

      it 'must have a response' do
        expect(@cor_details).not_to be nil
      end

      it 'must have same id as in request' do
        expect(@cor_details['id']).to eq(@co_request['id'])
      end
    end

    context '#update' do
      before(:all) do
        @updated_details = FundAmerica::CancelOfferingRequest.update(@co_request['id'], {:status => 'confirmed'})
      end

      it 'must have a response' do
        expect(@updated_details).not_to be nil
      end

      it 'must have the updated status' do
        expect(@updated_details['status']).to eq('accepted')
      end
    end
  end
end
