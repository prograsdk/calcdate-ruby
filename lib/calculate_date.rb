# frozen_string_literal: true

require "calculate_date/version"
require 'calculate_date/interpreter'

module CalculateDate
  class Error < StandardError; end
  # Your code goes here...

  def calculate_date(string)
    CalculateDate::Interpreter.new(string).interpret
  end
end
