# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'dot_calculator'

# Test file for the dot_calculator.rb file
class DotCalculatorTest < Minitest::Test
  def test_sums
    assert_equal dot_calculator('..... + ...............'), '....................'
  end

  def test_substractions
    assert_equal dot_calculator('..... - ...'), '..'
    assert_equal dot_calculator('..... - .'), '....'
    assert_equal dot_calculator('. - .'), ''
  end

  def test_multiplications
    assert_equal dot_calculator('..... * ...'), '...............'
    assert_equal dot_calculator('..... * ..'), '..........'
  end

  def test_divisions
    assert_equal dot_calculator('..... // ..'), '..'
    assert_equal dot_calculator('..... // .'), '.....'
    assert_equal dot_calculator('. // ..'), ''
  end
end
