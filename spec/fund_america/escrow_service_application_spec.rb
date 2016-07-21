require 'spec_helper'

describe FundAmerica::EscrowServiceApplication do
  context '#list' do
    before(:all) do
      @response = FundAmerica::EscrowServiceApplication.list
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

  # TODO - Requires signed escrow_agreement.
  # Check on how an escrow_agreement can be signed via specs
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
      @escrow_agreement = FundAmerica::EscrowAgreement.create({:offering_id => @offering['id']})
      @signature = FundAmerica::ElectronicSignature.update(
        @escrow_agreement['electronic_signatures'].first['id'],
        :user_agent => 'FA Specs',
        :ip_address => '127.0.0.1',
        :literal => 'Test Signer',
        :name => 'Test Signer',
      )
      esa_options = {
        :offering_id => @offering['id'],
        :escrow_agreement_id => @escrow_agreement['id'],
        :ppm_url => 'http://www.rubyeffect.com',
        :ppm_username => 'test',
        :ppm_password => 'test'
      }
      begin
        @esa = FundAmerica::EscrowServiceApplication.create(esa_options)
      rescue FundAmerica::Error => e
        puts e.parsed_response
      end
    end

    it 'must have a response' do
      expect(@esa).not_to be nil
    end

    it 'must have object as escrow_service_application' do
      expect(@esa['object']).to eq('escrow_service_application')
    end

    context '#details' do
      before(:all) do
        @esa_details = FundAmerica::EscrowServiceApplication.details(@esa['id'])
      end

      it 'must have a response' do
        expect(@esa_details).not_to be nil
      end

      it 'must have same id as in request' do
        expect(@esa_details['id']).to eq(@esa['id'])
      end
    end

    context '#update' do
      before(:all) do
        @updated_details = FundAmerica::EscrowServiceApplication.update(@esa['id'], {:status => 'accepted'})
      end

      it 'must have a response' do
        expect(@updated_details).not_to be nil
      end

      it 'must have status as accepted' do
        expect(@updated_details['status']).to eq('accepted')
      end
    end
  end
end
