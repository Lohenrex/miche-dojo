# frozen_string_literal: true

# A class to convert phrases into pig latin
class PigLatin
  def pig_it(phrase)
    phrase.split.map do |word|
      if ending_symbol?(word)
        handle_word_with_ending_symbol(word.chars)
      else
        handle_word_without_ending_symbol(word.chars)
      end
    end.join(' ')
  end

  private

  def ending_symbol?(word)
    word.match?(/[^\d\w\s]\z/)
  end

  def handle_word_with_ending_symbol(word)
    return word unless word.length > 1

    symbol = word.pop
    word.push("#{word[0]}ay#{symbol}")
    word.shift
    word.join
  end

  def handle_word_without_ending_symbol(word)
    word.rotate(1).append('ay').join
  end
end
