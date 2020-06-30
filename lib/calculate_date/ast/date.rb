# frozen_string_literal: true

require 'calculate_date/ast/node'

module CalculateDate
  module AST
    class Date < Node
      def initialize(expr, token)
        @expr = expr
        @token = token
        @unit = token.value
      end

      attr_reader :expr, :unit
    end
  end
end
