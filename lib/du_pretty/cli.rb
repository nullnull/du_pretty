require 'du_pretty'
require 'thor'

module DuPretty
  class CLI < Thor
    default_task :path
    desc 'path', ''
    option :min_gbyte, type: :numeric
    option :min_mbyte, type: :numeric
    option :min_byte, type: :numeric
    option :depth, type: :numeric, aliases: :d
    def path(path = '.')
      puts path
      puts options
    end
  end
end
