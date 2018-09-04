require 'du_pretty'
require 'thor'

module DuPretty
  class CLI < Thor
    default_command :search
    desc 'search', 'search is my default_command'
    def search
      puts 'hello world!'
    end
  end
end
