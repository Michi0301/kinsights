module Parsers
  class CommaFloat < Base
    def parse
      string.strip.gsub('.', '').gsub(',', '.').to_f
    end
  end
end