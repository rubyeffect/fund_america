require 'spec_helper'

describe FundAmerica::EscrowAgreement do
  context '#list' do
    before(:all) do
      @response = FundAmerica::EscrowAgreement.list
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
        :city => 'New York',
        :country => 'US',
        :email => "test#{t}@test.com",
        :name => "Company U#{t}",
        :phone => '12025551212',
        :postal_code => '10005',
        :region => 'NY',
        :street_address_1 => '123 wall st',
        :tax_id_number => '999999999',
        :type => 'company',
        :executive_name => "Exec U#{t}",
        :region_formed_in => 'NY'
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

      @escrow_agreement = FundAmerica::EscrowAgreement.create({:offering_id => @offering['id']})
    end

    it 'must have a response' do
      expect(@escrow_agreement).not_to be nil
    end

    it 'must have object as escrow_agreement' do
      expect(@escrow_agreement['object']).to eq('escrow_agreement')
    end

    context '#details' do
      before(:all) do
        @ea_details = FundAmerica::EscrowAgreement.details(@escrow_agreement['id'])
      end

      it 'must have a response' do
        expect(@ea_details).not_to be nil
      end

      it 'must have matching id passed in request' do
        expect(@ea_details['id']).to eq(@escrow_agreement['id'])
      end
    end
  end
end
