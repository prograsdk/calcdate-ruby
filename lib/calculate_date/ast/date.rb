# frozen_string_literal: true

require 'calculate_date/token'
require 'calculate_date/ast/node'
require 'pry'

module CalculateDate
  module AST
    class Date < Node
      DAY = 'day'
      MONTH = 'month'
      YEAR = 'year'
      DATE_RESOLVES = {
        day: DAY,
        days: DAY,
        month: MONTH,
        months: MONTH,
        year: YEAR,
        years: YEAR,
      }

      def initialize(expr, token)
        @expr = expr
        @token = token
        @unit = token.value
      end

      attr_reader :expr, :unit

      def weed
        new_token = CalculateDate::Token.new(token.type, DATE_RESOLVES[token.value.to_sym])

        Date.new(expr.weed, new_token)
      end

      # def visit
      #   {
      #     unit.to_sym => expr.visit
      #   }
      # end
    end
  end
end
