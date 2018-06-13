module Parsers
  class Integer < Base
    def parse
      string.gsub('.', '').strip.to_i
    end
  end
end