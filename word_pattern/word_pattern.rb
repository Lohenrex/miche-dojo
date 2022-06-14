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