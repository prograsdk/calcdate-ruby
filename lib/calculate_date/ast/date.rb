# frozen_string_literal: true

require 'calculate_date/ast/node'

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

      # def visit
      #   {
      #     unit.to_sym => expr.visit
      #   }
      # end
    end
  end
end
