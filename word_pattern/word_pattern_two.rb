# frozen_string_literal: true

def word_pattern_two_revenge_of_the_zip(pattern, string)
  word_array = string.split
  pattern_chars = pattern.chars
  raise StandardError, 'Pattern and phrase length are not equal' if pattern_chars.length != word_array.length

  word_pattern_map = pattern_chars.uniq.zip(word_array.uniq).to_h
  return false if word_pattern_map.values.any?(&:nil?)

  pattern_chars.zip(word_array).all? { |item| word_pattern_map.fetch(item[0]) == item[1] }
end
