# frozen_string_literal: true

require "calculate_date/version"

module CalculateDate
  class Error < StandardError; end
  # Your code goes here...

  def calculate_date(string)
    Time.now
  end
end
