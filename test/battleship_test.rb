require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'
require './lib/battleship.rb'
require 'pry'

class BattleshipTest < Minitest::Test

  def test_game_exists
    game = Battleship.new
    assert_instance_of Battleship, game
  end

  def test_game_displays_opening_sequence
    game = Battleship.new
    assert_equal game.opening_sequence, "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
  end

  def test_instructions
    game = Battleship.new
    assert_equal game.instructions, "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A4 B2"
  end

  def test_coward_quit
    game = Battleship.new
    assert_equal game.coward_quit, "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def test_invalid_input
    game = Battleship.new
    assert_equal game.invalid_input, "Please decide what you would like to do."
  end

  def test_game_play_when_press_f
    game = Battleship.new
    assert_equal game.play(input = "f"), ["A2", "B4"]
  end

  def test_game_play_when_press_l
    game = Battleship.new
    assert_equal game.play(input = "l"), "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A4 B2"
  end

  def test_game_play_when_press_d
    game = Battleship.new
    assert_equal game.play(input = "d"), "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def test_game_play_when_press_anything_else
    game = Battleship.new
    assert_equal game.play(input = "asdf"), "Please decide what you would like to do."
  end

  def test_start_plays_game
    skip
    game = Battleship.new
    game.start
  end
end
