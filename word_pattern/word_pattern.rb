def word_pattern(pattern, string)
  resulting_pattern = []
  word_pattern_map = {}
  word_array = string.split(' ')

  raise StandardError.new "Pattern and phrase length are not equal" if pattern.length != word_array.length

  return false unless pattern.chars.uniq.length == word_array.uniq.length

  word_array.each_with_index do |word, i|
    word_pattern_map.store(pattern[i], word) if !word_pattern_map.key? pattern[i]
    resulting_pattern << pattern[i] if word_pattern_map.fetch(pattern[i]) == word
  end

  pattern == resulting_pattern.join('')
end

def word_pattern_two_revenge_of_the_zip(pattern, string)
  word_array = string.split(' ')
  pattern_chars = pattern.chars
  raise StandardError.new "Pattern and phrase length are not equal" if pattern_chars.length != word_array.length

  word_pattern_map = pattern_chars.uniq.zip(word_array.uniq).to_h
  return false if word_pattern_map.values.any?(&:nil?)

  pattern_chars.zip(word_array).all? { |item| word_pattern_map.fetch(item[0]) == item[1] }
end