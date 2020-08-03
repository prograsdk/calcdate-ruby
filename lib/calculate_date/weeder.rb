require 'string'
require 'calculate_date/token'
require 'calculate_date/visitor'

module CalculateDate
  class Weeder
    include CalculateDate::Visitor

    def initialize(root, options = {})
      @root = root
      @options = options
    end

    attr_reader :root, :options

    def weed
      visit(root)
    end

    def visit_date(node)
      new_token = CalculateDate::Token.new(node.token.type, CalculateDate::AST::Date::DATE_RESOLVES[node.token.value.to_sym])

      CalculateDate::AST::Date.new(visit(node.expr), new_token)
    end

    def visit_number(node)
      CalculateDate::AST::Number.new(node.token)
    end

    def visit_binary_operator(node)
      CalculateDate::AST::BinaryOperator.new(visit(node.left_expr), node.token, visit(node.right_expr))
    end
  end
end
