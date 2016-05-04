# SuccessRecorder
A gem that helps you to track success/failure ratios. Uses Redis.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'success_recorder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install success_recorder

## Usage

```ruby
SuccessRecorder.success('key')
SuccessRecorder.failure('key')
SuccessRecorder.report('key')


SuccessRecorder.success(['key1', 'key2', 3]) #the key in redis is 'key1:key2:3'
SuccessRecorder.failure(['key1', 'key2', 3])
SuccessRecorder.report(['key1', 'key2', 3])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. 

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/vasilakisfil/success_recorder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
