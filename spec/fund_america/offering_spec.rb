require 'spec_helper'

describe FundAmerica::Offering, :vcr do
  context '#details' do
    let(:response) { FundAmerica::Offering.details(offering_id) }

    context 'when offering exists' do
      let(:offering_id) { 'LIJpysymRHyXvDrX_nvizw' }

      it 'returns offering details' do
        expect(response).to include('object' => 'offering', 'id' => offering_id)
      end
    end

    context 'when offering does not exist' do
      let(:offering_id) { 'XXX' }

      it 'raises FundAmerica::Error' do
        expect { response }.to raise_error(FundAmerica::Error)
      end

      it 'raises FundAmerica::Error with proper message' do
        response
      rescue FundAmerica::Error => e
        expect(e.message).to include 'not found'
      end
    end
  end
end
