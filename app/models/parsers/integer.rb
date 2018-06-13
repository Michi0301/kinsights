module Parsers
  class Integer < Base
    def parse
      string.strip.to_i
    end
  end
end