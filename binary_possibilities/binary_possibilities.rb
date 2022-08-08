class BinaryPossibilities
  OPTIONS = %w[1 0]

  def initialize(input)
    @input = input
  end

  def possibilities
    output_size
  end

  private

  def output_size
    OPTIONS.size ** @input.count("?")
  end
end