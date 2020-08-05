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
      resolve_hash = CalculateDate::AST::Date::DATE_RESOLVES[node.token.value.to_sym]
      new_date_token = CalculateDate::Token.new(node.token.type, resolve_hash[:unit])
      new_number_token = CalculateDate::Token.new(node.expr.token.type, node.expr.value * resolve_hash[:value])

      new_number_expr = CalculateDate::AST::Number.new(new_number_token)

      CalculateDate::AST::Date.new(visit(new_number_expr), new_date_token)
    end

    def visit_number(node)
      CalculateDate::AST::Number.new(node.token)
    end

    def visit_binary_operator(node)
      CalculateDate::AST::BinaryOperator.new(visit(node.left_expr), node.token, visit(node.right_expr))
    end
  end
end
