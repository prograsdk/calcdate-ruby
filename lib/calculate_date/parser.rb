# frozen_string_literal: true

require 'calculate_date/lexer'
require 'calculate_date/lexing/token'
require 'calculate_date/exceptions'

module CalculateDate
  class Parser

    attr_reader :numbers, :signs, :ast

    ######################################
    # Parsing code                       #
    ######################################

    def eat(token_type)
      if current_token.type == token_type
        current_token = next_token
      else
        raise Exceptions::SyntaxError('Invalid syntax')
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
