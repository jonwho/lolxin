[![Gem Version](https://badge.fury.io/rb/lolxin.svg)](https://badge.fury.io/rb/lolxin)
[![Build Status](https://travis-ci.org/jonwho/lolxin.svg)](https://travis-ci.org/jonwho/lolxin)
[![Code Climate](https://codeclimate.com/github/jonwho/lolxin/badges/gpa.svg)](https://codeclimate.com/github/jonwho/lolxin)
[![Test Coverage](https://codeclimate.com/github/jonwho/lolxin/badges/coverage.svg)](https://codeclimate.com/github/jonwho/lolxin/coverage)
[![Issue Count](https://codeclimate.com/github/jonwho/lolxin/badges/issue_count.svg)](https://codeclimate.com/github/jonwho/lolxin)

# Lolxin

The not-so-smooth API wrapper for League of Legends.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lolxin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lolxin

## Usage

TODO: Document how to use

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

For testing purposes I am using the gem
[dotenv](https://github.com/bkeepers/dotenv) to load my API key. I recommend
you do the same and not to commit your .env file to git to keep it a secret by
adding it to your .gitignore file. If you decide not to use dotenv for whatever
reason make sure to comment it out in the bin/console script. Also add/remove
any variables you see fit to speed up manual testing.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/jonwho/lolxin. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
