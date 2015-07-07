require 'spec_helper'

describe FundAmerica::EntityRelationship do
  context '#list' do
    before(:all) do
      @response = FundAmerica::EntityRelationship.list
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
      t_one = Time.now.to_i
      options_one = {
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
      @entity_one = FundAmerica::Entity.create(options_one)
      t_two = Time.now.to_i
      options_two = {
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
      @entity_two = FundAmerica::Entity.create(options_two)

      er_options = {
        :child_entity_id => @entity_one['id'],
        :description => 'Also a major stockholder.',
        :parent_entity_id => @entity_two['id'],
        :parent_title => 'CEO'
      }
      @entity_relationship = FundAmerica::EntityRelationship.create(er_options)
    end

    it 'must return a response' do
      expect(@entity_relationship).not_to be nil
    end

    it 'must have object as entity_relationship' do
      expect(@entity_relationship['object']).to eq('entity_relationship')
    end

    context '#details' do
      before(:all) do
        @er_details = FundAmerica::EntityRelationship.details(@entity_relationship['id'])
      end

      it 'must have a response' do
        expect(@er_details).not_to be nil
      end

      it 'must have same id as in request' do
        expect(@er_details['id']).to eq(@entity_relationship['id'])
      end
    end

    context '#update' do
      before(:all) do
        @updated_details = FundAmerica::EntityRelationship.update(@entity_relationship['id'], {:description => 'changed'})
      end

      it 'must have a response' do
        expect(@updated_details).not_to be nil
      end

      it 'must have changed value' do
        expect(@updated_details['description']).to eq('changed')
      end
    end

    context '#delete' do
      it 'must return response' do
        expect(FundAmerica::EntityRelationship.delete(@entity_relationship['id'])).not_to be nil
      end
    end
  end
end
