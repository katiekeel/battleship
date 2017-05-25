require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battle_orcs.rb'
require 'pry'

class BattleOrcsTest < Minitest::Test

  def test_game_exists
    game = BattleOrcs.new
    assert_instance_of BattleOrcs, game
  end

  def test_game_displays_opening_sequence
    game = BattleOrcs.new
    assert_equal game.opening_sequence, "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
  end

  def test_instructions
    skip
    game = BattleOrcs.new
    assert_equal game.instructions, "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A1 B1"
  end

  def test_coward_quit
    skip
    game = BattleOrcs.new
    assert_equal game.coward_quit, "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def test_invalid_input
    skip
    game = BattleOrcs.new
    assert_equal game.invalid_input, "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war."
  end

  def test_game_play_when_press_f
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "f"), player_ship_placement
  end

  def test_game_play_when_press_l
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "l"), "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A1 B1"
  end

  def test_game_play_when_press_d
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "d"), "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def test_game_play_when_press_anything_else
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "asdf"), "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war."
  end

  def test_start_plays_game
    game = BattleOrcs.new
    assert_equal game.start, "The war is begun!"
  end

  def test_computer_ship_placement
    game = BattleOrcs.new
    assert_equal game.computer_group_placement, "\n\nThe Enemy has placed their groups!\n\n"
  end

  def test_player_ship_placement
    game = BattleOrcs.new
    assert_equal game.player_group_placement, "Prepare to fight!\n\n\n"
  end
end
