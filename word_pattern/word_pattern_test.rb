# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'word_pattern'

# Test file for the word_pattern.rb file
class WordPatternTest < Minitest::Test
  def test_with_a_one_letter_pattern_and_one_different_word
    assert_equal word_pattern('aaaa', 'cat cat cat cat'), true
  end

  def test_with_a_one_letter_pattern_and_two_different_words
    assert_equal word_pattern('aaaa', 'cat cat dog cat'), false
  end

  def test_with_a_two_different_letter_pattern_and_one_different_word
    assert_equal word_pattern('aabb', 'pangolin pangolin pangolin pangolin'), false
  end

  def test_with_a_four_different_letter_pattern_and_four_different_words
    assert_equal word_pattern('abbccd', 'aram zam zam arafi arafi guli'), true
  end

  def test_with_a_longer_length_pattern_and_shorter_length_phrase
    exception = assert_raises(StandardError) { word_pattern('abbcc', 'aram zam zam') }
    assert_equal('Pattern and phrase length are not equal', exception.message)
  end
end
