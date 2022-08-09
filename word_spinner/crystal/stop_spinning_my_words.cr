def spin_words(string : String)
  string.split.map { |word| word.size > 4 ? word.reverse : word }.join(' ')
end
