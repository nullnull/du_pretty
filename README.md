# DuPretty
[![Gem](https://img.shields.io/gem/v/du_pretty.svg)](https://rubygems.org/gems/du_pretty)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![CircleCI](https://circleci.com/gh/nullnull/du_pretty/tree/master.svg?style=svg)](https://circleci.com/gh/nullnull/du_pretty/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/2cc73b7dea6a066b6f9b/maintainability)](https://codeclimate.com/github/nullnull/du_pretty/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2cc73b7dea6a066b6f9b/test_coverage)](https://codeclimate.com/github/nullnull/du_pretty/test_coverage)

Show pretty print of `du` outputs.

[![Image from Gyazo](https://i.gyazo.com/75f461882b3d0ba01dce40c79de543dd.png)](https://gyazo.com/75f461882b3d0ba01dce40c79de543dd)

## Installation
```sh
$ gem install 'du_pretty'
```

## Usage
```sh
$ du_pretty <path>

# specify max depth
$ du_pretty <path> -d 2

# Filter results of `du` by its file's size
$ du_pretty <path> --size 10M
```

[![Image from Gyazo](https://i.gyazo.com/e3668cda06afde799fee8d8cf16abaa2.png)](https://gyazo.com/e3668cda06afde799fee8d8cf16abaa2)


```sh
# Show results sorted by the file's size
$ du_pretty <path> --sort
```

[![Image from Gyazo](https://i.gyazo.com/d8ddc6c2a12a80bf7d07eaf9d63aa0b0.png)](https://gyazo.com/d8ddc6c2a12a80bf7d07eaf9d63aa0b0)

```sh
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
