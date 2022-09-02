# frozen_string_literal: true

class BinaryPossibilities
  OPTIONS = %w[1 0].freeze

  def initialize(input)
    @input = input
  end

  def possibilities
    output_size
  end

  private

  def output_size
    OPTIONS.size**@input.count('?')
  end
end
