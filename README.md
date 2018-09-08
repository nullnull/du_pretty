# DuPretty
[![Gem](https://img.shields.io/gem/v/du_pretty.svg)](https://rubygems.org/gems/du_pretty)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![CircleCI](https://circleci.com/gh/nullnull/du_pretty/tree/master.svg?style=svg)](https://circleci.com/gh/nullnull/du_pretty/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/2cc73b7dea6a066b6f9b/maintainability)](https://codeclimate.com/github/nullnull/du_pretty/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2cc73b7dea6a066b6f9b/test_coverage)](https://codeclimate.com/github/nullnull/du_pretty/test_coverage)

Show pretty print of `du` outputs.

[![Image from Gyazo](https://i.gyazo.com/be6f718ff31cec830d2bddfeb6da2756.png)](https://gyazo.com/be6f718ff31cec830d2bddfeb6da2756)

## Installation
```sh
$ gem install 'du_pretty'
```

## Usage
```sh
$ du_pretty <path>

# specify max depth (default 1)
$ du_pretty <path> -d 2

# Filter results of `du` by its file's size
$ du_pretty <path> --size 50M
```

[![Image from Gyazo](https://i.gyazo.com/99eca1755d9c112cdfde70e2de2290e6.png)](https://gyazo.com/99eca1755d9c112cdfde70e2de2290e6)

```sh
# Show results sorted by the file's size (default)
$ du_pretty <path> --sort
```

[![Image from Gyazo](https://i.gyazo.com/c330d33adc4c546acd3ccd1b2a9d2755.png)](https://gyazo.com/c330d33adc4c546acd3ccd1b2a9d2755)

```sh
# Show tree like results.
$ du_pretty <path> --tree

# help
$ du_pretty --help
```


## Development
```sh
# run
$ bundle install
$ bundle exec exe/du_pretty

# test
$ bundle exec rspec spec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nullnull/du_pretty. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DuPretty project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/du_pretty/blob/master/CODE_OF_CONDUCT.md).
