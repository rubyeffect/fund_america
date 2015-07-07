require 'spec_helper'

describe FundAmerica::AchAuthorization do
  context '#list' do
    before(:all) do
      @response = FundAmerica::AchAuthorization.list
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

  context '#agreement_html' do
    before(:all) do
      @agreement = FundAmerica::AchAuthorization.agreement_html
    end

    it 'must return agreement html' do
      expect(@agreement).not_to be nil
    end

    it 'must have key agreement_html in response' do
      expect(@agreement).to include 'agreement_html'
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

      ach_options = {
        :account_number => '0000123456789',
        :account_type => 'checking',
        :address => '555 Some St',
        :check_type => 'personal',
        :city => 'Las Vegas',
        :email => "test#{t}@test.com",
        :entity_id => @entity['id'],
        :ip_address => '127.0.0.1',
        :literal => "Test U#{t}",
        :name_on_account => "Test U#{t}",
        :phone => '17025551212',
        :routing_number => '122287251',
        :state => 'NV',
        :user_agent => 'NO NAME BROWSER 1.0',
        :zip_code => '89123'
      }
      @ach_authorization = FundAmerica::AchAuthorization.create(ach_options)
    end

    it 'must return a response' do
      expect(@ach_authorization).not_to be nil
    end

    it 'must have object as ach_authorization' do
      expect(@ach_authorization['object']).to eq('ach_authorization')
    end

    it 'must have an id' do
      expect(@ach_authorization['id']).not_to be nil
    end

    context '#details' do
      before(:all) do
        @ach_auth = FundAmerica::AchAuthorization.details(@ach_authorization['id'])
      end

      it 'must return a response' do
        expect(@ach_auth).not_to be nil
      end

      it 'must have an id' do
        expect(@ach_auth['id']).not_to be nil
      end

      it 'must return the id same as the one sent in request' do
        expect(@ach_auth['id']).to eq(@ach_authorization['id'])
      end
    end

    context '#delete' do
      before(:all) do
        @del_ach_auth = FundAmerica::AchAuthorization.delete(@ach_authorization['id'])
      end

      it 'must return a response' do
        expect(@del_ach_auth).not_to be nil
      end

      it 'must have an id' do
        expect(@del_ach_auth['id']).not_to be nil
      end

      it 'must return the id same as the one sent in request' do
        expect(@del_ach_auth['id']).to eq(@ach_authorization['id'])
      end
    end

    context '#ach_tokens' do
      before(:all) do
        @ach_token = FundAmerica::AchAuthorization.ach_tokens({:entity_id => @entity['id']})
      end

      it 'must return a response' do
        expect(@ach_token).not_to be nil
      end

      it 'must have a url' do
        expect(@ach_token['url']).not_to be nil
      end

      it 'must have object as ach_token' do
        expect(@ach_token['object']).to eq('ach_token')
      end
    end
  end
end
