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
    assert_equal board.game_board[0], "====="
  end

  def test_board_has_numbers_row
    board = Board.new
    assert_equal board.game_board[1], ".1234"
  end

  def test_board_has_a_row
    board = Board.new
    assert_equal board.game_board[2], "A    "
  end

  def test_board_has_b_row
    board = Board.new
    assert_equal board.game_board[3], "B    "
  end

  def test_board_has_c_row
    board = Board.new
    assert_equal board.game_board[4], "C    "
  end

  def test_board_has_d_row
    board = Board.new
    assert_equal board.game_board[5], "D    "
  end

  def test_board_has_bottom_equals_row
    board = Board.new
    assert_equal board.game_board[6], "====="
  end

end
