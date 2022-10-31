# frozen_string_literal: true

# class for manipulating arrays and obtaining odd ints
class OddInt
  def find_it(sequence)
    sequence.tally.find { |_, value| value.odd? }[0]
  end
end
