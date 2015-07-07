require 'spec_helper'

describe FundAmerica::SubscriptionAgreementTemplate do
  context '#list' do
    before(:all) do
      @response = FundAmerica::SubscriptionAgreementTemplate.list
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
      sat_options = {
        :draft_content => "Test draft content %%VESTING_AMOUNT%%, %%VESTING_AS%%, %%VESTING_AS_EMAIL%%, %%SUBSCRIBER_SIGNATURE%%, %%ISSUER_SIGNATURE%%",
        :issuer_company => "Test company #{t}",
        :issuer_email => "test#{t}@test.com",
        :issuer_literal => "Lit #{t}",
        :issuer_metadata => '{}',
        :issuer_name => "Issuer #{t}",
        :issuer_title => 'CEO',
        :publish => 'true',
        :offering_id => @offering['id']
      }
      @sat = FundAmerica::SubscriptionAgreementTemplate.create(sat_options)
    end

    it 'must return a response' do
      expect(@sat).not_to be nil
    end

    it 'must have object as subscription_agreement_template' do
      expect(@sat['object']).to eq('subscription_agreement_template')
    end

    context '#details' do
      before(:all) do
        @sat_details = FundAmerica::SubscriptionAgreementTemplate.details(@sat['id'])
      end

      it 'must return a response' do
        expect(@sat_details).not_to be nil
      end

      it 'must have the same id as in request' do
        expect(@sat_details['id']).to eq(@sat['id'])
      end
    end

    context '#update' do
      before(:all) do
        @update_details = FundAmerica::SubscriptionAgreementTemplate.update(@sat['id'], {:issuer_title => 'Director'})
      end

      it 'must return a response' do
        expect(@update_details).not_to be nil
      end

      it 'must have the changed value' do
        expect(@update_details['issuer_title']).to eq('Director')
      end
    end

    # TODO - Permissions error is being given for delete
    context '#delete' do
      it 'must return a response' do
        expect(FundAmerica::SubscriptionAgreementTemplate.delete(@sat['id'])).not_to be nil
      end
    end
  end
end
