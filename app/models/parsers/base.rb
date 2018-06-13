module Parsers
  class Base
    def initialize(string)
      @string = string
    end

    def parse
      raise 'Not implemented!'
    end

    private

    attr_reader :string
  end
end