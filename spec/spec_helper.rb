$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fund_america'
require 'vcr'

FundAmerica.api_key = ENV['FUND_AMERICA_SANDBOX_KEY']

RSpec::Matchers.define :be_boolean do
  match do |actual|
    actual == true || actual == false
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.before(:each, :vcr) do |test|
    select_or_create_vcr_cassette(test_name: test.description, full_test_context: self.class.name)
  end

  config.after(:each, :vcr) do
    VCR.eject_cassette
  end
end

def select_or_create_vcr_cassette(test_name: ,full_test_context:)
  full_path = full_test_context.gsub('::', '/') + "/#{test_name}"
  full_path.slice!('RSpec/ExampleGroups/')
  VCR.insert_cassette full_path
end
