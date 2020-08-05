# frozen_string_literal: true

require 'strscan'
require 'calculate_date/token'
require 'calculate_date/exceptions'

module CalculateDate
  class Lexer
    class LexingError < StandardError; end

    DATE_TOKEN = ['days', 'day', 'weeks', 'week', 'months', 'month', 'quarters', 'quarter', 'years', 'year']

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

    def date(token)
      @buffer.scan(Regexp.new(token)).to_s
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

        DATE_TOKEN.each do |token|
          return CalculateDate::Token.new(CalculateDate::Token::DATE_UNIT, date(token)) if @buffer.peek(token.length) == token
        end

        raise Exceptions::SyntaxError.new('Invalid syntax')
      end

      return CalculateDate::Token.new(CalculateDate::Token::EOS, nil)
    end
  end
end
