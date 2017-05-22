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
    assert_equal player.shoot("A2 B4"), [:A2, :B4]
  end

end
