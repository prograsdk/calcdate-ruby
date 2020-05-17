module CalculateDate
  module Lexing
    INTEGER = 'INTEGER'
    PLUS = 'PLUS'
    MINUS = 'MINUS'
    DATE_UNIT = 'DATE_UNIT'
    EOS = 'EOS'

    class Token
      def initialize(type, value)
        @type = type
        @value = value
      end

      attr_reader :type, :value

      def str
        "Token(#{type}, #{value.nil? ? 'None' : value})"
      end
    end
  end
end
