# frozen_string_literal: true

require 'calculate_date/ast/node'

module CalculateDate
  module AST
    class BinaryOperator < Node
      def initialize(left_expr, operator, right_expr)
        @left_expr = left_expr
        @right_expr = right_expr
        @token = operator
      end

      attr_reader :left_expr, :right_expr
    end
  end
end
