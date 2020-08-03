module CalculateDate
  module Visitor
    def visit(node)
      short_name = node.class.to_s.split('::').last.underscore
      send("visit_#{short_name}", node)
    end
  end
end
