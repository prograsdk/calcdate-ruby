module CalculateDate
  class Interpreter
    class InterpretationError < StandardError; end

    def initialize(root, environment = {})
      @root = root
      @environment = environment
    end

    attr_reader :root, :environment

    def visit(node)
      root.visit(node)
    end

    def visit_number(node)
      node.value
    end

    def visit_date(node)
      {
        node.unit => visit(node.expr)
      }
    end

    def visit_binary_operator(node)
      operator = node.token

      if operator == '+'

      elsif operator == '-'

      end
    end
  end
end
