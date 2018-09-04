# DuPretty
Show pretty print of `du` results.

[![Image from Gyazo](https://i.gyazo.com/8a7911cf58bb4ac1aa586cc24c8a307e.png)](https://gyazo.com/8a7911cf58bb4ac1aa586cc24c8a307e)

## Installation
```sh
$ gem install 'du_pretty'
```

## Usage
```sh
$ du_pretty <path>

# specify max depth
$ du_pretty -d 2 <path>

# show directories if its size is 100KB+
$ du_pretty --max-kbyte 100 <path>

# show directories sorted by its size
$ du_pretty --sort <path>

# help
$ du_pretty --help
```


## Development
```sh
# run
$ bundle install
$ bundle exec exe/du_pretty

# test
$ bundle exec rspec spec/du_pretty_spec.rb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nullnull/du_pretty. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DuPretty project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/du_pretty/blob/master/CODE_OF_CONDUCT.md).
