require 'spec_helper'

describe FundAmerica::Investment, :vcr do
  context '#delete' do
    let(:response) { FundAmerica::Investment.delete(investment['id']) }
    let(:investment) { create_investment }

    context 'when delete passed with success' do
      it 'returns investment' do
        expect(response['id']).to eq(investment['id'])
      end

      it 'returns investment with changed status to voided' do
        expect(response['status']).to eq('voided')
      end
    end

    context 'when investment is deleted' do
      before { FundAmerica::Investment.delete(investment['id']) }

      it 'returns nil' do
        expect(response).to be_nil
      end
    end

    context 'when investment does not exists' do
      let(:investment) { { 'id' => 'abc' } }

      it 'raises error' do
        error = /Resource was not found/
        expect { response }.to raise_error(FundAmerica::Error, error)
      end
    end
  end
end
