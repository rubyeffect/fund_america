module InvestmentHelper
  def create_investment
    @current_time = Time.now.to_i
    FundAmerica::Investment.create(investment_options)
  end

  private

  def investment_options
    {
      amount: '5000',
      entity: {
        city: 'Las Vegas',
        country: 'US',
        date_of_birth: '1980-01-01',
        email: "investor#{@current_time}@test.com",
        name: "Investor #{@current_time}",
        phone: '17025551212',
        postal_code: '89123',
        region: 'NV',
        street_address_1: '555 Some St',
        tax_id_number: '000000000'
      },
      equity_share_count: '10',
      offering_id: 'AflShkTFRm6neTWJe6UXcA',
      payment_method: 'wire'
    }
  end
end
