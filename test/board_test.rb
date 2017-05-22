require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board.rb'
require 'pry'

class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_top_equals_row
    board = Board.new
    assert_equal board.equals_nums_rows[:top_equals_row], "====="
  end

  def test_board_has_numbers_row
    board = Board.new
    assert_equal board.equals_nums_rows[:nums_row], ".1234"
  end

  def test_board_has_a_row
    board = Board.new
    assert_equal board.a_row, {:A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "}
  end

  def test_board_has_b_row
    board = Board.new
    assert_equal board.b_row, {:B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "}
  end

  def test_board_has_c_row
    board = Board.new
    assert_equal board.c_row, {:C => "C", :C1 => " ", :C2 => " ", :C3 => " ", :C4 => " "}
  end

  def test_board_has_d_row
    board = Board.new
    assert_equal board.d_row, {:D => "D", :D1 => " ", :D2 => " ", :D3 => " ", :D4 => " "}
  end

  def test_board_has_bottom_equals_row
    board = Board.new
    assert_equal board.equals_nums_rows[:bottom_equals_row], ["=", "=", "=", "=", "="].join("")
  end

  def test_computer_game_board_exists
    board = Board.new
    assert board.computer_game_board
  end

  def test_computer_display_board_exists
    board = Board.new
    assert board.computer_display_board
  end

  def test_player_game_board_exists
    board = Board.new
    assert board.player_game_board
  end

  def test_player_display_board_exists
    board = Board.new
    assert board.player_display_board
  end

  def test_player_ship_placement
    board = Board.new
    player = Player.new
    assert_equal board.player_ship_placement(player), board.player_display_board
  end


end
