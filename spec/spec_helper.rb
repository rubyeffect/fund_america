$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fund_america'

RSpec::Matchers.define :be_boolean do
  match do |actual|
    actual == true || actual == false
  end
end
