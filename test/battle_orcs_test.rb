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

  def test_game_has_a_player
    game = BattleOrcs.new
    assert_instance_of Player, game.player
  end

  def test_game_has_a_player_board
    game = BattleOrcs.new
    assert_instance_of PlayerBoard, game.player_board
  end

  def test_game_has_a_computer_board
    game = BattleOrcs.new
    assert_instance_of ComputerBoard, game.computer_board
  end

  def test_game_displays_opening_sequence
    game = BattleOrcs.new
    assert_equal game.opening_sequence, "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
  end

  def test_instructions
    skip
    game = BattleOrcs.new
    assert_equal game.instructions, "===== INSTRUCTIONS ====="
  end

  def test_coward_quit
    game = BattleOrcs.new
    assert_equal game.coward_quit, "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def test_invalid_input
    skip
    game = BattleOrcs.new
    assert_equal game.invalid_input, "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war.\n\n"
  end

  def test_game_play_when_press_f
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "f"), "\n\nThe war is begun!\n\n"
  end

  def test_game_play_when_press_l
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "l"), "===== INSTRUCTIONS ====="
  end

  def test_game_play_when_press_d
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "d"), "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def test_game_play_when_press_anything_else
    skip
    game = BattleOrcs.new
    assert_equal game.play(input = "asdf"), "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war.\n\n"
  end

  def test_start_plays_game
    skip
    game = BattleOrcs.new
    assert_equal game.start, "\n\nThe war against our Enemy is begun!"
  end

  def test_computer_ship_placement
    game = BattleOrcs.new
    assert_equal game.computer_group_placement, "\n\nThe Enemy has placed their groups!\n\n"
  end

  def test_player_ship_placement
    skip
    game = BattleOrcs.new
    assert_equal game.player_group_placement, "Prepare to fight!\n\n\n"
  end

  def test_shoot
    skip
    game = BattleOrcs.new
    assert_equal game.shoot, "\n\nWe shall strike first! Forth to victory!\n\n"
  end

  def test_end_player_turn
    skip
    game = BattleOrcs.new
    assert_equal game.end_player_turn("\n"), game.shoot
  end

  def test_check_if_group_killed
    skip
    game = BattleOrcs.new
    game.computer_group_placement
    refute game.check_if_group_killed
  end

  def test_end_sequence
    skip
    game = BattleOrcs.new
    assert_equal game.end_sequence, "\n\nThe battle is over!\n\n"
  end

  def test_game_timer
    game = BattleOrcs.new
    assert game.game_timer
  end
end
