# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'temp_converter'

# Test file for the temp_converter.rb file
class TempConverterTest < Minitest::Test

  def test_conversion_from_celsius_to_kelvin
    @converter = TempConverter.new(0, input_scale: 'celsius', output_scale: 'kelvin')
    assert_in_delta @converter.convert_temp, 273.15, 0.01
  end

  def test_conversion_from_celsius_to_fahrenheit
    @converter = TempConverter.new(0, input_scale: 'celsius', output_scale: 'fahrenheit')
    assert_equal @converter.convert_temp, 32
  end

  def test_conversion_from_fahrenheit_to_celsius
    @converter = TempConverter.new(0, input_scale: 'fahrenheit', output_scale: 'celsius')
    assert_in_delta @converter.convert_temp, -17.777, 0.01
  end

  def test_conversion_from_fahrenheit_to_kelvin
    @converter = TempConverter.new(0, input_scale: 'fahrenheit', output_scale: 'kelvin')
    assert_in_delta @converter.convert_temp, 255.372222, 0.01
  end

  def test_conversion_from_kelvin_to_fahrenheit
    @converter = TempConverter.new(0, input_scale: 'kelvin', output_scale: 'fahrenheit')
    assert_in_delta @converter.convert_temp, -459.67, 0.01
  end

  def test_conversion_from_kelvin_to_celsius
    @converter = TempConverter.new(0, input_scale: 'kelvin', output_scale: 'celsius')
    assert_in_delta @converter.convert_temp, -273.15, 0.01
  end
end
