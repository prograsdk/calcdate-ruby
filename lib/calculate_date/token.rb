module CalculateDate
  class Token
    INTEGER = 'INTEGER'
    PLUS = 'PLUS'
    MINUS = 'MINUS'
    DATE_UNIT = 'DATE_UNIT'
    HOUR_UNIT = 'HOUR_UNIT'
    EOS = 'EOS'

    attr_reader :type, :value

    def initialize(type, value)
      @type = type
      @value = value
    end

    def str
      "Token(#{type}, #{value.nil? ? 'None' : value})"
    end
  end
end
