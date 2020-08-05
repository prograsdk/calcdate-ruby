# frozen_string_literal: true

require 'calculate_date/ast/node'

module CalculateDate
  module AST
    class Date < Node
      DAY = 'days'
      MONTH = 'months'
      YEAR = 'years'
      DATE_RESOLVES = {
        day: { value: 1, unit: DAY },
        days: { value: 1, unit: DAY },
        week: { value: 7, unit: DAY },
        weeks: { value: 7, unit: DAY },
        month: { value: 1, unit: MONTH },
        months: { value: 1, unit: MONTH },
        year: { value: 1, unit: YEAR },
        years: { value: 1, unit: YEAR },
        quarter: { value: 3, unit: MONTH },
        quarters: { value: 3, unit: MONTH }
      }

      def initialize(expr, token)
        @expr = expr
        @token = token
        @unit = token.value
      end

      attr_reader :expr, :unit
    end
  end
end
