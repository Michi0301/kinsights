# frozen_string_literal: true

module Parsers
  class CommaFloat < Base
    def parse
      string.strip.delete('.').tr(',', '.').to_f
    end
  end
end
