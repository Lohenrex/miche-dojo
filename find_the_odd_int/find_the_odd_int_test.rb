# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'find_the_odd_int'

# Test file for the find_the_odd_int.rb file
class OddIntTest < Minitest::Test
  def test_it_works
    assert_equal(OddInt.new.find_it([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5]), 5)
    assert_equal(OddInt.new.find_it([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5]), -1)
    assert_equal(OddInt.new.find_it([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5]), 5)
    assert_equal(OddInt.new.find_it([10]), 10)
    assert_equal(OddInt.new.find_it([1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1]), 10)
  end
end
