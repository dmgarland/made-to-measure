# MadeToMeasure

Needed to use some server side Google analytics and found their [Measurement Protocol](https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide). Couldn't find anything useful after 10 minutes Googling, and their official gem looked overkill for what is basically a HTTP request.

This might be a nice exercise for open source Ruby newbies to work on a project. I've only implemented the e-commerce hit, but there is quite a bit to do [here](https://developers.google.com/analytics/devguides/collection/protocol/v1/reference). PRs welcome!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'made_to_measure'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install made_to_measure

## Usage

See the spec folder

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dmgarland/made_to_measure. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MadeToMeasure project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dmgarland/made_to_measure/blob/master/CODE_OF_CONDUCT.md).
