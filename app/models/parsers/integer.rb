# frozen_string_literal: true

module Parsers
  class Integer < Base
    def parse
      string.delete('.').strip.to_i
    end
  end
end
