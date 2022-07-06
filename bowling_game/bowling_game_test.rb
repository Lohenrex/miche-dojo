# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'bowling_game'

# Test file for the bowling_game.rb file
class BowlingGameTest < Minitest::Test
  def setup
    @game = BowlingGame.new
  end

  def test_the_right_bonus_for_a_spare
    assert_equal @game.spare, "something"
  end

  def test_the_right_bonus_for_a_strike
    assert_equal @game.strike, "something"
  end
end
