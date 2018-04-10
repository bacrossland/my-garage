# MyGarage

Welcome to MyGarage! This is a multi-threaded ruby application for racing cars. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'my_garage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install my_garage

## Usage

To go for a quick ride, at the command prompt run the following:

```ruby
$ MyGarage.go_for_a_ride
```

To list the cars currently in the garage:

```ruby
$ MyGarage.list_cars
```

You can also get your own instance of car. 


```ruby
car = MyGarage::Camaro.new

# Methods
car.turn_on # start the car
car.drive # move the car forward
car.brake # slow the car down
car.turn_off # turn the car off

# Properties
car.brand # maker of the car
car.color # color of the car
car.max_speed # top speed of the car in mph
car.name # model of the car

# States
car.current_speed # speed the car is going in mph
car.motion # symbol of car's current motion state: :stop or :moving
```

Note: ```brand``` and ```max_speed``` are the only two properties you can change after you initialize a car instance. 
All other properties have to be set at time of initialization. The states ```current_speed``` and ```motion``` are governed internally 
and can't be set.

## Original Scope

This application was built to answer the questions outlined in the [SCOPE.md](https://github.com/[USERNAME]/my_garage/SCOPE.md) file.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/my_garage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Things to do

* Add more testing. Current test suite is lacking.
* Two cars can race each other.
* More advanced race track.
* Add more cars.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MyGarage project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/my_garage/blob/master/CODE_OF_CONDUCT.md).
