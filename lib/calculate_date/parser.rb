# frozen_string_literal: true

require 'strscan'
require 'calculate_date/parsing/token'

module CalculateDate
  class Parser
    class ParseError < StandardError; end
    class SyntaxError < ParseError; end

    attr_reader :numbers, :signs, :ast

    def initialize(str)
      @buffer = StringScanner.new(str)
      toke
    end

    ######################################
    # Lexing code                        #
    ######################################
    def skip_whitespace
      @buffer.skip(/\s+/)
    end

    def integer
      @buffer.scan(/\d+/).to_i
    end

    def next_token
      unless @buffer.eos?
        if @buffer.peek(1).match(/\s/)
          skip_spaces
          next
        end

        if @buffer.peek(1).match(/\d/)
          return CalculateDate::Parsing::Token(CalculateDate::Parsing::INTEGER, integer)
        end

        if @buffer.peek(1) == '+'
          return CalculateDate::Parsing::Token(CalculateDate::Parsing::PLUS, '+')
        end

        if @buffer.peek(1) == '-'
          return CalculateDate::Parsing::Token(CalculateDate::Parsing::MINUS, '-')
        end

        raise SyntaxError('Invalid syntax')
      end

      return CalculateDate::Parsing::Token(CalculateDate::Parsing::EOS, nil)
    end

    ######################################
    # Parsing code                       #
    ######################################

    def eat(token_type)
      if current_token.type == token_type
        current_token = next_token
      else
        raise SyntaxError('Invalid syntax')
      end
    end

    def factor
      eat(CalculateDate::Parsing::INTEGER)
    end

    def expr
      factor

      token = current_token
      if token.type == CalculateDate::Parsing::PLUS
        eat(CalculateDate::Parsing::PLUS)
        factor
      elsif token.type == CalculateDate::Parsing::MINUS
        eat(CalculateDate::Parsing::MINUS)
        factor
      end
    end
  end
end
