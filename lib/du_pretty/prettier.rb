require 'colorize'
require 'pathname'

module DuPretty
  class Prettier
    def initialize(path, min_kbyte: 0, depth: nil, with_files: false)
      @path = File.expand_path(path, Pathname.pwd)
      @min_kbyte = min_kbyte
      @depth = depth
      @with_files = with_files
    end

    def original
      filtered_disk_usages.map(&:pretty).join("\n")
    end

    def sorted
      filtered_disk_usages.sort_by(&:kbyte).map(&:pretty).join("\n")
    end

    def tree
      filtered_disk_usages.reverse.map(&:tree_format).join("\n")
    end

    private

    def du
      options = [
        @depth.nil? ? nil : "-d #{@depth}",
        @with_files ? '-a' : nil,
        '-k'
      ]
      `du #{options.join(' ')} #{@path}`
    end

    def disk_usages
      xs = du.split("\n").map { |line| DiskUsage.new(line, @path) }
      total = xs.map(&:kbyte).max
      xs.map { |x| DiskUsage.new(x.raw, @path, total: total) }
    end

    def filtered_disk_usages
      disk_usages.select { |x| x.kbyte >= @min_kbyte }
    end

    class DiskUsage
      attr_accessor :raw, :kbyte, :path

      def initialize(raw, root, total: nil)
        @raw = raw
        @root = root
        @kbyte = raw.split("\t").compact[0].to_i
        @path = raw.split("\t").compact[1]
        @total = total
      end

      def pretty
        pretty_byte + "\t." + relative_path
      end

      def tree_format
        pretty_path + ' ' + pretty_byte
      end

      private

      def basename
        Pathname.new(@path).basename.to_s
      end

      def depth
        Pathname.new(relative_path).each_filename.to_a.size - 1
      end

      def pretty_byte
        mb = @kbyte * 1.0 / 1024
        gb = mb / 1024
        byte_format = ->(x) { x.to_i >= 10 ? x.to_i : x.round(1) }
        f = ->(value, unit, color) { "#{byte_format.call(value)}#{unit} (#{percentage})".send(color) }
        if gb >= 1.0
          if gb > 10
            f.call(gb, 'GB', :red)
          else
            f.call(gb, 'GB', :light_red)
          end
        elsif mb >= 1.0
          if mb > 500
            f.call(mb, 'MB', :yellow)
          else
            f.call(mb, 'MB', :light_yellow)
          end
        else
          if @kbyte > 500
            f.call(@kbyte, 'KB', :green)
          else
            f.call(@kbyte, 'KB', :light_green)
          end
        end
      end

      def pretty_path
        return '.' if @path == @root
        spaces = depth.positive? ? '  ' * depth : ''
        tree_symbol = '└── '
        spaces + tree_symbol + basename
      end

      def percentage
        percentage = @kbyte * 1.0 / @total * 100
        "#{percentage.ceil}%"
      end

      def relative_path
        @path.sub(/^#{@root}/, '')
      end
    end
  end
end
