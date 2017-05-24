require 'simplecov'
SimpleCov.start
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
    assert_equal board.equals_nums_rows[:top_equals_row], ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join("")
  end

  def test_board_has_numbers_row
    board = Board.new
    assert_equal board.equals_nums_rows[:nums_row], [".", 1, 2, 3, 4].join("   ")
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
    assert_equal board.equals_nums_rows[:bottom_equals_row], ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join("")
  end

  def test_board_has_game_board
    skip
    board = Board.new
    assert_equal board.game_board, game_board
  end

  def test_board_has_display_board
    skip
    board = Board.new
    assert_equal board.display_board
  end

  def test_computer_can_place_two_unit_group
    skip
    board = Board.new
    board.two_unit_computer_group_placement
  end

  def test_computer_can_place_three_unit_group
    skip
    board = Board.new
    board.three_unit_computer_group_placement
  end


end
