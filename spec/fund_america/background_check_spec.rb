require 'spec_helper'

describe FundAmerica::BackgroundCheck do
  context '#list' do
    before(:all) do
      @response = FundAmerica::BackgroundCheck.list
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
        :city => 'Artie',
        :date_of_birth => '1980-01-01',
        :email => 'dale.mulford@example.com',
        :name => 'Dale Mulford',
        :phone => '13048540483',
        :postal_code => '25008',
        :region => 'WV',
        :street_address_1 => '1038 White Oak Creek Rd',
        :tax_id_number => '520102674',
        :type => 'person'
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
      FundAmerica::Offering.update(@offering['id'], {:accept_investments => true})
      bc_options = {
        :offering_id => @offering['id'],
        :entity_id => @entity['id']
      }
      @background_check = FundAmerica::BackgroundCheck.create(bc_options)
    end

    it 'must return a response' do
      expect(@background_check).not_to be nil
    end

    it 'must have object as background_check' do
      expect(@background_check['object']).to eq('background_check')
    end

    context '#details' do
      before(:all) do
        @bc_details = FundAmerica::BackgroundCheck.details(@background_check['id'])
      end

      it 'must return a response' do
        expect(@bc_details).not_to be nil
      end

      it 'must match id from request' do
        expect(@bc_details['id']).to eq(@background_check['id'])
      end
    end
  end
end
