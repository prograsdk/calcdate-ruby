# frozen_string_literal: true

require 'strscan'
require 'calculate_date/lexing/token'

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

    def next_token
      while !@buffer.eos?
        if @buffer.peek(1).match(/\s/)
          skip_whitespace
          next
        end

        if @buffer.peek(1).match(/\d/)
          return CalculateDate::Lexing::Token.new(CalculateDate::Lexing::INTEGER, integer)
        end

        if @buffer.peek(1) == '+'
          return CalculateDate::Lexing::Token.new(CalculateDate::Lexing::PLUS, '+')
        end

        if @buffer.peek(1) == '-'
          return CalculateDate::Lexing::Token.new(CalculateDate::Lexing::MINUS, '-')
        end

        raise SyntaxError('Invalid syntax')
      end

      return CalculateDate::Lexing::Token.new(CalculateDate::Lexing::EOS, nil)
    end
  end
end
