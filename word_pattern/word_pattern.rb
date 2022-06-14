# frozen_string_literal: true

def word_pattern(pattern, string)
  word_array = string.split
  raise StandardError, 'Pattern and phrase length are not equal' if pattern.length != word_array.length
  return false unless pattern.chars.uniq.length == word_array.uniq.length

  pattern == resulting_pattern(word_array, pattern)
end

def resulting_pattern(words, pattern)
  new_pattern = []
  word_pattern_map = {}
  words.each_with_index do |word, i|
    word_pattern_map.store(pattern[i], word) unless word_pattern_map.key? pattern[i]
    new_pattern << pattern[i] if word_pattern_map.fetch(pattern[i]) == word
  end

  new_pattern.join
end
