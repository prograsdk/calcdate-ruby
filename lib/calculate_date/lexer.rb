# frozen_string_literal: true

require 'strscan'
require 'calculate_date/token'
require 'calculate_date/exceptions'

module CalculateDate
  class Lexer
    class LexingError < StandardError; end
    def initialize(str)
      @buffer = StringScanner.new(str)
    end

    def skip_whitespace
      @buffer.skip(/\s+/)
    end

    def integer
      @buffer.scan(/\d+/).to_i
    end

    def binary_operator
      @buffer.getch
    end

    def next_token
      while !@buffer.eos?
        if @buffer.peek(1).match(/\s/)
          skip_whitespace
          next
        end

        return CalculateDate::Token.new(CalculateDate::Token::INTEGER, integer) if @buffer.peek(1).match(/\d/)
        return CalculateDate::Token.new(CalculateDate::Token::PLUS, binary_operator) if @buffer.peek(1) == '+'
        return CalculateDate::Token.new(CalculateDate::Token::MINUS, binary_operator) if @buffer.peek(1) == '-'

        raise Exceptions::SyntaxError.new('Invalid syntax')
      end

      return CalculateDate::Token.new(CalculateDate::Token::EOS, nil)
    end
  end
end
