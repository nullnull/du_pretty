require 'du_pretty'
require 'du_pretty/utils'
require 'thor'

module DuPretty
  class CLI < Thor
    default_task :path
    desc 'path', <<~EOT
Details:
  -a, --all
      Display an entry for each file in a file hierarchy.

  -d depth
      Display an entry for all files and directories depth directories deep.

  --size n[kMGT]
      Filter results of `du` by its filesize. if n is followed by a scale indicator then the file's size is compared to n scaled as:
      k(default)   kilobytes (1024 bytes)
      M            megabytes (1024 kilobytes)
      G            gigabytes (1024 megabytes)
      T            terabytes (1024 gigabytes)

  --sort
      Show results sorted by the file's size.
    EOT
    option :all, aliases: :a, type: :boolean
    option :depth, type: :numeric, aliases: :d
    option :size, aliases: :s
    option :sort, type: :boolean
    option :tree, type: :boolean, default: true

    def path(path = '.')
      prettier = DuPretty::Prettier.new(
        path,
        min_kbyte: DuPretty::Utils.size_to_kbyte(options[:size]),
        depth: options[:depth],
        with_files: options[:all]
      )
      result = if options[:sort]
                 prettier.sorted
               elsif options[:tree] == false
                 prettier.original
               else
                 prettier.tree
               end
      print result + "\n"
    end
  end
end
