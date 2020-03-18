# Creed - Stupid Simple Commands for Rails

Creed provides a stupid simple way to introduce the [Command Pattern](https://en.wikipedia.org/wiki/Command_pattern) to your Rails app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'creed'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install creed

## Usage

Create your Command classes in `app/commands`, extending `Creed::Command`, and implementing a `perform` method:

```ruby
class CreateUser < Creed::Command
  # Define types and/or validations.
  param :user_params, Creed::Types.Instance(ActionController::Parameters)

  def perform
    # Do something here...
  end
end
```

Then in your controller (or anywhere):

```ruby
class UserController < ApplicationController
  def create
    CreateUser.perform(user_params)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joelmoss/creed. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/joelmoss/creed/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Creed project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joelmoss/creed/blob/master/CODE_OF_CONDUCT.md).
