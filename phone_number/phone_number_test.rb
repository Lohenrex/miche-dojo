# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'phone_number'

# Test file for the phone_number.rb file
class PhoneNumberTest < Minitest::Test
  def test_it_works_in_the_happy_path
    assert_equal(Formatter.new.phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]), '(123) 456-7890')
    assert_equal(Formatter.new.phone_number([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), '(111) 111-1111')
  end

  def test_it_fails_when_not_using_arrays
    exception = assert_raises(StandardError) { Formatter.new.phone_number(1) }
    assert_equal('This is an array exclusive zone. Go away', exception.message)

    exception = assert_raises(StandardError) { Formatter.new.phone_number({}) }
    assert_equal('This is an array exclusive zone. Go away', exception.message)
  end

  def test_it_fails_when_not_single_digits
    exception = assert_raises(StandardError) { Formatter.new.phone_number([14, 2, 553, 46, 5, 76, 7, 8, 954, 0]) }
    assert_equal('Hey, slow down! just a single digit per array entry', exception.message)

    exception = assert_raises(StandardError) do
      Formatter.new.phone_number([1, 1, 167, 1565, 178, 155, 1, 71, 15_556, 1])
    end
    assert_equal('Hey, slow down! just a single digit per array entry', exception.message)
  end

  def test_it_fails_when_not_enough_phone_digits
    exception = assert_raises(StandardError) { Formatter.new.phone_number([]) }
    assert_equal('Hey, we need the 9 digits to create a phone number!', exception.message)

    exception = assert_raises(StandardError) { Formatter.new.phone_number([1, 2, 3, 4, 5, 6, 7, 8]) }
    assert_equal('Hey, we need the 9 digits to create a phone number!', exception.message)
  end

  def test_it_fails_when_not_using_integers_as_digits
    exception = assert_raises(StandardError) { Formatter.new.phone_number([1, '@', 'a33er', 2, 2, 2, 2, 2]) }
    assert_equal('Phones only have integers as digits, moron!', exception.message)

    exception = assert_raises(StandardError) { Formatter.new.phone_number([5, 4, 4.3, 2, 1, 1, 1, 1, 1]) }
    assert_equal('Phones only have integers as digits, moron!', exception.message)
  end
end
