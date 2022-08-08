# frozen_string_literal: true

def spin_words(string)
  string.split.map { |word| word.length > 4 ? word.reverse : word }.join(' ')
end
