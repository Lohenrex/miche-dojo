# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'phone_number'

# Test file for the phone_number.rb file
class PhoneNumberTest < Minitest::Test
  def test_it_works_in_the_happy_path
    assert_equal(PhoneNumberFormatter.new.format([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]), '(123) 456-7890')
    assert_equal(PhoneNumberFormatter.new.format([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), '(111) 111-1111')
  end

  def test_it_works_with_words_in_the_happy_path
    assert_equal(PhoneNumberFormatter.new.format([8, 0, 0, 'L', 'L', 'A', 'M', 'A', 'Y', 'A']), '(800) 552-6292')
    assert_equal(PhoneNumberFormatter.new.format([6, 6, 'A', 'Y', 'm', 'i', 'g', 'u', 'e', 'l']), '(662) 964-4835')
  end

  def test_it_fails_when_not_using_arrays
    exception = assert_raises(StandardError) { PhoneNumberFormatter.new.format(1) }
    assert_equal('This is an array exclusive zone. KEEP OUT!', exception.message)

    exception = assert_raises(StandardError) { PhoneNumberFormatter.new.format({}) }
    assert_equal('This is an array exclusive zone. KEEP OUT!', exception.message)
  end

  def test_it_fails_when_not_single_digits
    exception = assert_raises(StandardError) { PhoneNumberFormatter.new.format([14, 2, 553, 46, 5, 76, 7, 8, 954, 0]) }
    assert_equal('Hey, slow down! just a single digit per array entry', exception.message)

    exception = assert_raises(StandardError) do
      PhoneNumberFormatter.new.format([1, 1, 167, 1565, 178, 155, 1, 71, 15_556, 1])
    end
    assert_equal('Hey, slow down! just a single digit per array entry', exception.message)
  end

  def test_it_fails_when_not_enough_phone_digits
    exception = assert_raises(StandardError) { PhoneNumberFormatter.new.format([]) }
    assert_equal('Hey, we need the 9 digits to create a phone number!', exception.message)

    exception = assert_raises(StandardError) { PhoneNumberFormatter.new.format([1, 2, 3, 4, 5, 6, 7, 8]) }
    assert_equal('Hey, we need the 9 digits to create a phone number!', exception.message)
  end

  def test_it_fails_when_not_using_integers_as_digits
    exception = assert_raises(StandardError) { PhoneNumberFormatter.new.format([5, 4, 4.3, 2, 1, 1, 1, 1, 1]) }
    assert_equal('We only accept integers and chars here. Try again!', exception.message)
  end
end
