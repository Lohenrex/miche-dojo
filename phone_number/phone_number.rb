# frozen_string_literal: true

class Formatter
  def phone_number(numbers)
    run_validations(numbers)

    "(#{numbers[0..2].join}) #{numbers[3..5].join}-#{numbers[6..9].join}"
  end

  private

  def run_validations(numbers)
    raise StandardError, 'This is an array exclusive zone. Go away' if input_class_is_invalid?(numbers)
    raise StandardError, 'Phones only have integers as digits, moron!' if digits_arenot_integers?(numbers)
    raise StandardError, 'Hey, we need the 9 digits to create a phone number!' if input_length_is_invalid?(numbers)
    raise StandardError, 'Hey, slow down! just a single digit per array entry' if digit_length_is_invalid?(numbers)
  end

  def input_class_is_invalid?(numbers)
    !numbers.is_a? Array
  end

  def digit_length_is_invalid?(numbers)
    numbers.find { |number| number > 9 }
  end

  def input_length_is_invalid?(numbers)
    numbers.size != 10
  end

  def digits_arenot_integers?(numbers)
    numbers.find { |number| !number.is_a? Integer }
  end
end
