# FundAmerica

This is a ruby gem to provide easy implementation of FundAmerica API

## Installation

Add this line to your application's Gemfile:

    gem 'fund_america'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fund_america

You have to set environments in your project:

    FUND_AMERICA_API_KEY = 'ABCDEFG'
    FUND_AMERICA_ENVIRONMENT = 'sandbox'
Environment could be `sandbox` or `production`.

### Running tests

To the run tests get a sandbox key from `https://sandbox.fundamerica.com/accounts/<your-account>/api_keys` then run:

    $ env FUND_AMERICA_API_KEY='<YOUR-SANDBOX-KEY>' rspec

## Usage

If you wish to see FundAmerica's API documentation, please visit the url: `https://docs.fundamerica.com/?version=latest`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributors

1. Dan M (https://github.com/dan987)
2. Charles S (https://github.com/Designbookcom)
3. David Reid (https://github.com/dreid)
4. Paweł Strącała (https://github.com/Ununuk) - BF Team

## Authored by

Sanjay Vedula (sanjay.vedula@gmail.com)
