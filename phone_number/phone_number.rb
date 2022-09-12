# frozen_string_literal: true

# Formats input into the correct output. In this case, a phone number
class PhoneNumberFormatter
  LEXICON = [nil,
             nil,
             %w[a b c],
             %w[d e f],
             %w[g h i],
             %w[j k l],
             %w[m n o],
             %w[p q r s],
             %w[t u v],
             %w[w x y z]].freeze

  def format(numbers)
    run_validations(numbers)

    numbers = decode_phonewords(numbers)

    "(#{numbers[0..2].join}) #{numbers[3..5].join}-#{numbers[6..9].join}"
  end

  private

  def run_validations(numbers)
    raise StandardError, 'This is an array exclusive zone. KEEP OUT!' if input_class_is_invalid?(numbers)
    raise StandardError, 'We only accept integers and chars here. Try again!' if digits_are_not_valid?(numbers)
    raise StandardError, 'Hey, we need the 9 digits to create a phone number!' if input_length_is_invalid?(numbers)
    raise StandardError, 'Hey, slow down! just a single digit per array entry' if digit_length_is_invalid?(numbers)
  end

  def input_class_is_invalid?(numbers)
    !numbers.is_a? Array
  end

  def digit_length_is_invalid?(numbers)
    numbers.find { |number| number.is_a?(Integer) && number > 9 }
  end

  def input_length_is_invalid?(numbers)
    numbers.size != 10
  end

  def digits_are_not_valid?(numbers)
    numbers.find { |number| !number.is_a?(Integer) && !number.is_a?(String) }
  end

  def decode_phonewords(numbers)
    numbers.map do |number|
      number.is_a?(Integer) ? number : LEXICON.find_index { |lex| lex&.include? number.downcase }
    end
  end
end
