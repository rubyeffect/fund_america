require 'spec_helper'

describe FundAmerica::Entity do
  context '#list' do
    before(:all) do
      @response = FundAmerica::Entity.list
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
    context 'person entity' do
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
      end

      it 'must return an entity' do
        expect(@entity).not_to be nil
      end

      it 'must have entity as person' do
        expect(@entity['type']).to eq('person')
      end

      it 'must not have entity as company' do
        expect(@entity['type']).not_to eq('company')
      end

      it 'must be an entity object' do
        expect(@entity['object']).to eq('entity')
      end

      it 'must have an id' do
        expect(@entity['id']).not_to be nil
      end

      context '#details' do
        before(:all) do
          @entity_details = FundAmerica::Entity.details(@entity['id'])
        end

        it 'must return details' do
          expect(@entity_details).not_to be nil
        end

        it 'must be an entity object' do
          expect(@entity_details['object']).to eq('person')
        end

        it 'must return entity details for the given entity id' do
          expect(@entity_details['id']).to eq(@entity['id'])
        end
      end

      context '#ach_authorizations' do
        before(:all) do
          @entity_ach_authorizations = FundAmerica::Entity.ach_authorizations(@entity['id'])
        end

        it 'must have object in response' do
          expect(@entity_ach_authorizations['object']).not_to be nil
        end

        it 'must have object as resource_list' do
          expect(@entity_ach_authorizations['object']).to eq('resource_list')
        end

        it 'must have total_resources in response' do
          expect(@entity_ach_authorizations['total_resources']).not_to be nil
        end

        it 'must have total_resources as 0 or more' do
          expect(@entity_ach_authorizations['total_resources']).to be >= 0
        end

        it 'must have page in response' do
          expect(@entity_ach_authorizations['page']).not_to be nil
        end

        it 'must have page as 1 or more' do
          expect(@entity_ach_authorizations['page']).to be >= 1
        end

        it 'must have per in response' do
          expect(@entity_ach_authorizations['per']).not_to be nil
        end

        it 'must have more in response' do
          expect(@entity_ach_authorizations['more']).not_to be nil
        end

        it 'must have more as boolean value' do
          expect(@entity_ach_authorizations['more']).to be_boolean
        end

        it 'must have resources in response' do
          expect(@entity_ach_authorizations['resources']).not_to be nil
        end

        it 'must have resources as array' do
          expect(@entity_ach_authorizations['resources']).to be_instance_of(Array)
        end
      end

      context '#investor_suitability_details' do
        before(:all) do
          @investor_suitability_details = FundAmerica::Entity.investor_suitability_details(@entity['id'])
        end

        it 'must return investor suitability details' do
          expect(@investor_suitability_details).not_to be nil
        end

        it 'must have object as investor_suitability' do
          expect(@investor_suitability_details['object']).to eq('investor_suitability')
        end
      end

      context '#cash_blotter' do
        it 'must return a response' do
          expect(FundAmerica::Entity.cash_blotter(@entity['id'])).not_to be nil
        end
      end

=begin
      # TODO - The delete method gives a permission error
      # Uncomment after it is tested in production
      context '#delete' do
        before(:all) do
          @entity_delete = FundAmerica::Entity.delete(@entity['id'])
        end

        it 'must return investor suitability details' do
          expect(@entity_delete).not_to be nil
        end

        it 'must have object as person' do
          expect(@entity_delete['object']).to eq('person')
        end

        it 'must match entity id in request' do
          expect(@entity_delete['id']).to eq(@entity['id'])
        end
      end
=end
    end

    context 'company entity' do
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
      end

      it 'must return an entity' do
        expect(@entity).not_to be nil
      end

      it 'must have entity as company' do
        expect(@entity['type']).to eq('company')
      end

      it 'must not have entity as person' do
        expect(@entity['type']).not_to eq('person')
      end

      it 'must be an entity object' do
        expect(@entity['object']).to eq('entity')
      end

      it 'must have an id' do
        expect(@entity['id']).not_to be nil
      end

=begin
      # TODO - Gives 500 internal server error
      context '#update' do
        before(:all) do
          @updated_details = FundAmerica::Entity.update(@entity['id'], {:executive_name => 'test'} )
        end

        it 'must have a response' do
          expect(@updated_details).not_to be nil
        end

        it 'must have changed value' do
          expect(@updated_details['executive_name']).to eq('test')
        end
      end
=end

      context '#details' do
        before(:all) do
          @entity_details = FundAmerica::Entity.details(@entity['id'])
        end

        it 'must return details' do
          expect(@entity_details).not_to be nil
        end

        it 'must be an entity object' do
          expect(@entity_details['object']).to eq('company')
        end

        it 'must return entity details for the given entity id' do
          expect(@entity_details['id']).to eq(@entity['id'])
        end
      end
    end
  end
end
