# FundAmerica

This is a ruby gem to provide easy implementation of FundAmerica API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fund_america'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fund_america

## Usage

The details on usage of FundAmerica gem are present at: http://blog.rubyeffect.com/category/fundamerica/. If you wish to see FundAmerica's API documentation, please visit the url: https://apps.fundamerica.com/support/documentation

1. [FundAmerica Gem Introductory Post](http://blog.rubyeffect.com/fundamerica-gem/)
2. [Entity Endpoints Part One](http://blog.rubyeffect.com/fundamerica-gem-entity-endpoints/)
3. [Entity Endpoints Part Two](http://blog.rubyeffect.com/fundamerica-gem-entity-endpoints-part-two/)
4. [API Info](http://blog.rubyeffect.com/fundamerica-gem-api-info-ach-authorizations/)
5. [ACH Authorizations](http://blog.rubyeffect.com/fundamerica-gem-api-info-ach-authorizations/)
6. [Background Checks](http://blog.rubyeffect.com/fundamerica-gem-background-checks-bank-info/)
7. [Bank Info](http://blog.rubyeffect.com/fundamerica-gem-background-checks-bank-info/)
8. [Error Handling](http://blog.rubyeffect.com/fundamerica-gem-error-handling/)
9. [Offerings](http://blog.rubyeffect.com/fundamerica-gem-offerings/)
10. [Cancel Offering Request](http://blog.rubyeffect.com/fundamerica-gem-cancel-close-offering-requests/)
11. [Close Offering Request](http://blog.rubyeffect.com/fundamerica-gem-cancel-close-offering-requests/)

## TODO

1. Addition of new end points as per the latest FundAmerica latest changelog
2. Addition of paginated results fetch, sorting and hide options for resource_list responses
3. Support for ruby versions < 2.2.2
4. More test cases

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

### Running tests

To the run tests get a sandbox key from `https://sandbox.fundamerica.com/accounts/<your-account>/api_keys` then run:

```console
$ env FUND_AMERICA_SANDBOX_KEY='<YOUR-SANDBOX-KEY>' rspec
```

## Contributing

1. Fork it ( https://github.com/rubyeffect/fund_america/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

1. Dan M (https://github.com/dan987)
2. Charles S (https://github.com/Designbookcom)
3. David Reid (https://github.com/dreid)

## About RubyEffect

![RubyEffect](http://www.rubyeffect.com/blog/wp-content/uploads/2015/05/cropped-re_original_logo.png)

RubyEffect builds intuitive, live and elegant software that solves real world problems. We love open source and it's community.

Liked this gem? You may also like the articles we post on our [blog](http://blog.rubyeffect.com). Please do check

We would love to work on your ideas and see them grow. Say hello @ http://rubyeffect.com/contact
