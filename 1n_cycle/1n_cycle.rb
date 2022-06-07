class Cycle
	attr_reader :nummer
	def initialize(nummer)
		@nummer = nummer
	end

	def cycle
		array = arraify_decimals(1.0/nummer)
	end

	def arraify_decimals(float)
		float.to_s.split(".")[1].split("").map(&:to_i)
	end
end

binding.irb