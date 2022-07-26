# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'rgb2hex'

# Test file for the rgb2hex.rb file
class Rgb2HexTest < Minitest::Test
  def test_some_colors
    assert_equal rgb(10, 0, 255), '0A00FF'
    assert_equal rgb(63, 200, 4), '3FC804'
  end

  def test_random_inputs
    assert_equal rgb(255, 234_435, -243), 'FFFF00'
  end
end
