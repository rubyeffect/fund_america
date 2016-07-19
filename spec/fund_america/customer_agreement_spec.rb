require 'spec_helper'

describe FundAmerica::CustomerAgreement do
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
  context "#edit" do
    before(:all) do
      @customer_agreement = FundAmerica::CustomerAgreement.edit(@entity['id'])
    end

    it "includes form description" do
      expect(@customer_agreement['form']).to be_instance_of(Hash)
    end

    it "includes resource" do
      expect(@customer_agreement['resource']).to be_instance_of(Hash)
    end

    it "includes customer agreement html" do
      expect(@customer_agreement['resource']['customer_agreement']).to be_instance_of(String)
    end
  end

  context "#update" do
    before(:all) do
      options = {
        :accept_customer_agreement => true,
        :annual_income => "250000",
        :net_worth => "1000000",
        :us_citizen_or_resident => true,
        :exempt_from_withholding => true,
        :type => "individual_net_worth"
      }
      @customer_agreement = FundAmerica::CustomerAgreement.update(@entity['id'], options)
    end

    it "includes accepted_customer_agreement" do
      expect(@customer_agreement['accepted_customer_agreement']).to be(true)
    end
  end
end
