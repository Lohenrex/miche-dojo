# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'binary_possibilities'

# Test file for the binary_possibilities.rb file
class BinaryPossibilitiesTest < Minitest::Test
  def test_single_wildcard
    assert_equal possibilities('?').sort, %w[0 1]
    assert_equal possibilities('101?').sort, %w[1010 1011]
  end

  def test_two_wildcards
    assert_equal possibilities('??').sort, %w[00 01 10 11]
    assert_equal possibilities('10??').sort, %w[1000 1001 1010 1011]
  end

  def test_mixed_wildcards
    assert_equal possibilities('1?1?').sort, %w[1010 1011 1110 1111]
  end

  def test_three_wildcards
    assert_equal possibilities('1?1??').sort, %w[10100 10101 10110 10111 11100 11101 11110 11111]
  end
end
