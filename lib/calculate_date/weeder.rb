module CalculateDate
  class Weeder
    def initialize(root, options = {})
      @root = root
      @options = options
    end

    attr_reader :root, :options

    def weed
      root.weed
    end
  end
end
