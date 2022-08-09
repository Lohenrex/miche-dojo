# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'stop_spinning_my_words'

# Test file for the word_pattern.rb file
class WordPatternTest < Minitest::Test
  def test_a_single_spinnable_word
    assert_equal spin_words('Welcome'), 'emocleW'
  end

  def test_a_phrase_with_spinnable_and_unspinnable_words
    assert_equal spin_words('Hey fellow warriors'), 'Hey wollef sroirraw'
  end
end
