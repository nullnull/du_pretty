module DuPretty
  module Utils
    def self.size_to_kbyte(size)
      return 0 if size.nil?
      size = size.upcase
      if size.end_with?('T')
        size.to_i * (1024**3)
      elsif size.end_with?('G')
        size.to_i * (1024**2)
      elsif size.end_with?('M')
        size.to_i * 1024
      else
        size.to_i
      end
    end
  end
end
