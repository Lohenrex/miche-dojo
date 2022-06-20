# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'pig_latin'

# Test file for the pig_latin.rb file
class PigLatinTest < Minitest::Test
  def setup
    @pig_latin = PigLatin.new
  end

  def test_a_simple_phrase_with_no_symbols
    assert_equal @pig_latin.pig_it('Pig latin is cool'), 'igPay atinlay siay oolcay'
  end

  # Considering cases with symbols between words that should not be altered
  def test_a_phrase_with_multiple_symbols
    assert_equal @pig_latin.pig_it("Hey, don't do this!"), "eyHay, on'tday oday histay!"
  end

  # Considering cases with isolated symbols
  def test_a_phrase_with_an_isolated_symbol
    assert_equal @pig_latin.pig_it('Quis custodiet ipsos custodes ?'), 'uisQay ustodietcay psosiay ustodescay ?'
  end

  def test_another_phrase_with_isolated_symbols
    assert_equal @pig_latin.pig_it('a . Bias di'), 'aay . iasBay iday'
  end

  def test_a_phrase_with_isolated_letters
    assert_equal @pig_latin.pig_it('A b C d E'), 'Aay bay Cay day Eay'
  end

end
