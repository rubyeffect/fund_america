$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fund_america'

FundAmerica.api_key = ENV['FUND_AMERICA_SANDBOX_KEY']

RSpec::Matchers.define :be_boolean do
  match do |actual|
    actual == true || actual == false
  end
end
