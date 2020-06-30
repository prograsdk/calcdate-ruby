module CalculateDate
  class Interpreter
    class InterpretationError < StandardError; end

    def initialize(root, environment = {})
      @root = root
      @environment = environment
    end

    attr_reader :root, :environment

    def evaluate
      Time.now.advance(visit(root))
    end

    def visit(node)
      short_name = node.class.to_s.split('::').last.underscore
      send("visit_#{short_name}", node)
    end

    def visit_number(node)
      node.value
    end

    def visit_date(node)
      {
        node.unit.to_sym => visit(node.expr)
      }
    end

    def visit_binary_operator(node)
      left_hash = visit(node.left_expr)
      right_hash = visit(node.right_expr)

      keys = (left_hash.keys + right_hash.keys).map(&:to_sym)

      keys.map do |key|
        left_value = left_hash.fetch(key, 0)
        right_value = right_hash.fetch(key, 0)

        value = left_value.send(node.token.value.to_sym, right_value)

        [key, value]
      end.to_h
    end
  end
end
