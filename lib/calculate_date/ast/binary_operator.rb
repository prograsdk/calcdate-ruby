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

      # def visit
      #   if operator == '+'

      #   elsif operator == '-'

      #   end


      # end

      private

      # def merge_hash(hash, new_hash)
      #   keys = hash.keys.map(&:to_sym) + new_hash.keys.map(&:to_sym)

      #   keys.map do |key|
      #     old_value = key
      #     [key, hash.fetch()]
      #   end
      # end
    end
  end
end
