# frozen_string_literal: true

class Formatter
  def phone_number(numbers)
    "(#{numbers[0..2].join}) #{numbers[3..5].join}-#{numbers[6..9].join}"
  end
end
