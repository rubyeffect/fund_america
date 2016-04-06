require 'spec_helper'

describe FundAmerica::WebhookLog do
  context '#list' do
    before(:all) do
      @response = FundAmerica::WebhookLog.list
      @webhook = nil
      @webhook = @response['resources'].first unless @response.nil?
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

    context 'using #list with pagination' do
      let(:base_url) { "https://sandbox.fundamerica.com/api/webhook_logs" }
      let(:base_url_with_params) { "https://sandbox.fundamerica.com/api/webhook_logs/?page=2&per=25" }

      it "builds the correct URL with no parameters" do
        expect(FundAmerica::API).to receive(:request).with(:get, base_url)
        FundAmerica::WebhookLog.list
      end

      it "throws an exception if only `page` is used" do
        expect { FundAmerica::WebhookLog.list(page: 2) }.to raise_error(ArgumentError)
      end

      it "throws an exception if only `per` is used" do
        expect { FundAmerica::WebhookLog.list(per: 25) }.to raise_error(ArgumentError)
      end

      it "builds the correct URL with both parameters" do
        expect(FundAmerica::API).to receive(:request).with(:get, base_url_with_params)
        FundAmerica::WebhookLog.list(page: 2, per: 25)
      end
    end

    context '#details' do
      it 'must have object as webhook_log' do
        unless @webhook.nil?
          expect(@webhook['object']).to eq('webhook_log')
        end
      end
    end
  end
end
