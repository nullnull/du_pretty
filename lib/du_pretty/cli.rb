require 'du_pretty'
require 'thor'

module DuPretty
  class CLI < Thor
    default_task :path
    desc 'path', ''
    option :min_gbyte, type: :numeric
    option :min_mbyte, type: :numeric
    option :min_kbyte, type: :numeric
    option :depth, type: :numeric, aliases: :d
    def path(path = '.')
      min_kbyte = [(options[:min_gbyte] || 0) * 1024 * 1024, (options[:min_mbyte] || 0) * 1024, (options[:min_kbyte] || 0)].max
      print DuWrapper.new(
        path,
        min_kbyte: min_kbyte,
        depth: options[:depth]
      ).pretty
      print "\n"
    end
  end
end
