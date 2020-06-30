# frozen_string_literal: true

require 'calculate_date/ast/node'

module CalculateDate
  module AST
    class Number < Node
      def initialize(token)
        @token = token
        @value = token.value
      end

      attr_reader :value

      def weed
        Number.new(token)
      end

      # def visit
      #   value
      # end
    end
  end
end
