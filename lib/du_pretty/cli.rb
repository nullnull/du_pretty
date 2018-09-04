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
    option :sort, aliases: :s, type: :boolean
    option :all, aliases: :a, type: :boolean
    option :tree, type: :boolean, default: true

    def path(path = '.')
      min_kbyte = [(options[:min_gbyte] || 0) * 1024 * 1024, (options[:min_mbyte] || 0) * 1024, (options[:min_kbyte] || 0)].max
      du_wrapper = DuWrapper.new(
        path,
        min_kbyte: min_kbyte,
        depth: options[:depth],
        with_files: options[:all],
      )
      result = if options[:sort]
        du_wrapper.sorted
      elsif options[:tree] == false
        du_wrapper.original
      else
        du_wrapper.tree
      end
      print result + "\n"
    end
  end
end
