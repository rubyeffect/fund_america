# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fund_america/version'

Gem::Specification.new do |spec|
  spec.name          = "fund_america"
  spec.version       = FundAmerica::VERSION
  spec.authors       = ["Sanjay Vedula"]
  spec.email         = ["opensource@rubyeffect.com"]

  spec.summary       = %q{Ruby gem for easy implementation of FundAmerica API in ruby, rails, sinatra apps}
  spec.description   = %q{This is a ruby gem to use the FundAmerica (http://www.fundamerica.com) API easily in your ruby, rails and sinatra apps built by RubyEffect (http://www.rubyeffect.com)}
  spec.homepage      = "http://www.rubyeffect.com/blog/category/fundamerica"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Development Dependencies
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry', "~> 0.10.1"
  spec.add_development_dependency 'rspec', "3.2.0"

  # Runtime Dependencies
  spec.add_runtime_dependency 'httparty', "~> 0.13.3"
  spec.add_runtime_dependency 'json', "1.8.2"

  # Ruby Dependency
  spec.required_ruby_version = "~> 2.2.2"
end
