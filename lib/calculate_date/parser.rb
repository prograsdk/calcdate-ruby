# frozen_string_literal: true

require 'calculate_date/lexer'
require 'calculate_date/token'
require 'calculate_date/exceptions'
require 'calculate_date/ast/binary_operator'
require 'calculate_date/ast/number'
require 'calculate_date/ast/date'

module CalculateDate
  class Parser
    attr_reader :lexer

    def initialize(lexer)
      @lexer = lexer

      @current_token = lexer.next_token
    end

    def eat(token_type)
      if @current_token.type == token_type
        @current_token = lexer.next_token
      else
        raise Exceptions::SyntaxError.new('Invalid syntax')
      end
    end

    def number
      token = @current_token
      eat(CalculateDate::Token::INTEGER)

      CalculateDate::AST::Number.new(token)
    end

    def date_term
      node = number

      token = @current_token
      eat(CalculateDate::Token::DATE_UNIT)

      node = CalculateDate::AST::Date.new(node, token)

      node
    end

    def term
      date_term
    end

    # grammar
    # expr: term ((PLUS | MINUS) term)*
    # term: date_term
    # date_term: number unit
    # number: INTEGER
    def expr
      node = term

      while [CalculateDate::Token::PLUS, CalculateDate::Token::MINUS].include? @current_token.type
        token = @current_token

        if token.type == CalculateDate::Token::PLUS
          eat(CalculateDate::Token::PLUS)
        elsif token.type == CalculateDate::Token::MINUS
          eat(CalculateDate::Token::MINUS)
        end

        node = CalculateDate::AST::BinaryOperator.new(node, token, term)
      end

      node
    end

    def parse
      expr
    end
  end
end
