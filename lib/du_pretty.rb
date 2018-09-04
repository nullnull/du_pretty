require 'colorize'
require 'pathname'

require 'du_pretty/version'
require 'du_pretty/cli'

module DuPretty
  class DuWrapper
    def initialize(path, min_kbyte: 0, depth: nil)
      @path = File.expand_path(path, Pathname.pwd)
      @min_kbyte = min_kbyte
      @depth = depth
    end

    def original
      disk_usages.map(&:pretty).join("\n")
    end

    def sorted
      disk_usages.sort_by(&:kbyte).map(&:pretty).join("\n")
    end

    def tree
      disk_usages.reverse.map(&:tree_format).join("\n")
    end

    private

    def du
      options = @depth.nil? ? '' : "-d #{@depth}"
      `du -k #{options} #{@path}`
    end

    def disk_usages
      du.split("\n")
        .map { |line| DiskUsage.new(line, @path) }
        .select { |x| x.kbyte >= @min_kbyte }
    end

    class DiskUsage
      attr_accessor :raw, :kbyte, :path

      def initialize(raw, root)
        @raw = raw
        @root = root
        @kbyte = raw.split("\t").compact[0].to_i
        @path = raw.split("\t").compact[1]
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
        mb = @kbyte / 1024
        gb = mb / 1024
        if gb.positive?
          if gb > 10
            "#{gb}GB".red
          else
            "#{gb}GB".light_red
          end
        elsif mb.positive?
          if mb > 500
            "#{mb}MB".yellow
          else
            "#{mb}MB".light_yellow
          end
        else
          if @kbyte > 500
            "#{@kbyte}KB".green
          else
            "#{@kbyte}KB".light_green
          end
        end
      end

      def pretty_path
        return '.' if @path == @root
        spaces = depth.positive? ? '  ' * depth : ''
        tree_symbol = '└── '
        spaces + tree_symbol + basename
      end

      def relative_path
        @path.sub(/^#{@root}/, '')
      end
    end
  end
end
