class TempConverter
	attr_reader :temp, :input_scale, :output_scale

	def initialize(temp, input_scale: 'celsius', output_scale: 'kelvin')
		@temp = temp
		@input_scale = input_scale
		@output_scale = output_scale
	end

	def convert_temp
		class_name = Object.const_get(input_scale.capitalize)
		class_name.new(temp).send("to_#{output_scale}")
	end
end

class Celsius
	attr_reader :temp

	def initialize(temp)
		@temp = temp
	end

	def to_fahrenheit
		temp * 1.8 + 32
	end

	def to_kelvin
		temp + 273.15
	end
end

class Fahrenheit
	attr_reader :temp

	def initialize(temp)
		@temp = temp
	end

	def to_celsius
		(temp - 32) / 1.8
	end

	def to_kelvin
		to_celsius + 273.15
	end
end

class Kelvin
	attr_reader :temp

	def initialize(temp)
		@temp = temp
	end

	def to_fahrenheit
		to_celsius * 1.8 + 32
	end

	def to_celsius
		temp - 273.15
	end
end
