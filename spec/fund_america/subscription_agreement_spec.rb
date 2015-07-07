require 'spec_helper'

describe FundAmerica::SubscriptionAgreement do
  context '#list' do
    before(:all) do
      @response = FundAmerica::SubscriptionAgreement.list
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

      @escrow_agreement = FundAmerica::EscrowAgreement.create({:offering_id => @offering['id']})

      sa_options = {
        :equity_share_count => '5',
        :data => '{"placeholder":"value"}',
        :offering_id => @offering['id'],
        :vesting_amount => '$5,000.00',
        :vesting_as => 'John Q Investor, 555 Some St., Las Vegas, NV 89123',
        :vesting_as_email => 'john.investor@example.com'
      }
      
      @sa = FundAmerica::SubscriptionAgreement.create(sa_options)
    end

    it 'must return a response' do
      expect(@sa).not_to be nil
    end

    it 'must have object as subscription_agreement' do
      expect(@sa['object']).to eq('subscription_agreement')
    end

    context '#details' do
      before(:all) do
        @sa_details = FundAmerica::SubscriptionAgreement.details(@sa['id'])
      end

      it 'must have a response' do
        expect(@sa_details).not_to be nil
      end

      it 'must have same id as in request' do
        expect(@sa_details['id']).to eq(@sa['id'])
      end
    end
  end
end
