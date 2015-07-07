require 'spec_helper'

describe FundAmerica::Investment do
  context '#list' do
    before(:all) do
      @response = FundAmerica::Investment.list
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
      investment_options = {
        :amount => '5000',
        :entity => {
          :city => 'Las Vegas',
          :country => 'US',
          :date_of_birth => '1980-01-01',
          :email => "investor#{t}@test.com",
          :name => "Investor #{t}",
          :phone => '17025551212',
          :postal_code => '89123',
          :region => 'NV',
          :street_address_1 => '555 Some St',
          :tax_id_number => '000000000'
        },
        :equity_share_count => '10',
        :offering_id => @offering['id'],
        :payment_method => 'wire'
      }
      @investment = FundAmerica::Investment.create(investment_options)
    end

    it 'must have a response' do
      expect(@investment).not_to be nil
    end

    it 'must have object as investment' do
      expect(@investment['object']).to eq('investment')
    end

    context '#details' do
      before(:all) do
        @investment_details = FundAmerica::Investment.details(@investment['id'])
      end

      it 'must have a response' do
        expect(@investment_details).not_to be nil
      end

      it 'must have same id as in request' do
        expect(@investment_details['id']).to eq(@investment['id'])
      end
    end

    context '#update' do
      before(:all) do
        @updated_details = FundAmerica::Investment.update(@investment['id'], {:status => 'received'})
      end

      it 'must have a response' do
        expect(@updated_details).not_to be nil
      end

      it 'must have same status as in request' do
        expect(@updated_details['status']).to eq('received')
      end
    end

    context '#billing_logs' do
      it 'must have a response' do
        @log = FundAmerica::Investment.billing_logs(@investment['id'])
        expect(@log).not_to be nil
      end
    end

    context '#investment_payments' do
      it 'must have a response' do
        @payments = FundAmerica::Investment.investment_payments(@investment['id'])
      end
    end

    context '#delete' do
      it 'must have a response' do
        @del = FundAmerica::Investment.delete(@investment['id'])
        expect(@del).not_to be nil
      end
    end
  end
end
