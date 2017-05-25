require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'
require 'pry'

class PlayerTest < Minitest::Test

  def test_player_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_player_can_enter_coords
    player = Player.new
    assert_equal player.get_coords("A2"), [:A2]
  end

  def test_code_will_sanitize_coords
    player = Player.new
    assert_equal player.get_coords("a2 b3"), [:A2, :B3]
  end



end
