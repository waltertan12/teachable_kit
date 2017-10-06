# TeachableKit

TeachableKit is a Ruby gem that wraps around the Teachable Mock API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'teachable_kit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install teachable_kit

## Usage

To use TeachableKit, simply initialize the client and either sign up or sign in
```ruby
client = TeachableKit::Client.new

client.sign_up(email: 'email@example.com', password: 'password', password_confirmation: 'password')
# or
client.sign_in(email: 'email@example.com', password: 'password')
```
## Design
The design for TeachableKit was taken heavily from DigitalOcean's [DropletKit](https://github.com/digitalocean/droplet_kit).

TeachableKit follows a strict design of resources as methods on your client. For examples, for users, you will call your client like this:
```ruby
client = TeachableKit::Client.new
client.users #=> UserResource
```

TeachableKit will return Plain Old Ruby objects that contain the information provided by the API. For example:
```ruby
client = TeachableKit::Client.new
client.sign_in(email: 'email@example.com', password: 'password')
client.users.get

# TeachableKit::User(id: 123, name: Nil, email: 'email@example.com', ...)
```

## Resources and Actions
### UserResource
```ruby
client = TeachableKit::Client.new
client.sign_in(email: 'email@example.com', password: 'password')
client.users
```

#### Actions supported
```ruby
client.users.get # Returns the current user
```

### OrderResource
```ruby
client = TeachableKit::Client.new
client.sign_in(email: 'email@example.com', password: 'password')
client.orders
```

#### Actions supported
```ruby
client.orders.all # Returns all of the orders for the current user
client.orders.create(total:, total_quantity:, special_instructions: nil) # Creates a new order for the current user
client.orders.delete(order_id:) # Deletes an order for the current user
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/waltertan12/teachable_kit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

