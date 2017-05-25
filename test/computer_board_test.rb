require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board.rb'

class ComputerBoardTest < Minitest::Test

  def test_computer_board_exists
    computer_board = ComputerBoard.new
    assert_instance_of ComputerBoard, computer_board
  end

  def test_computer_board_has_equals_and_nums_rows
    computer_board = ComputerBoard.new
    assert_equal computer_board.equals_nums_rows,
        {:top_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join(""),
        :nums_row => [".", 1, 2, 3, 4].join("   "),
        :bottom_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join("")}
  end

  def test_computer_board_has_player_view
  end

  def test_computer_board_has_a_row
    computer_board = ComputerBoard.new
    assert_equal computer_board.a_row, {:A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "}
  end

  def test_computer_board_has_b_row
    computer_board = ComputerBoard.new
    assert_equal computer_board.b_row, {:B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "}
  end

  def test_computer_board_has_c_row
    computer_board = ComputerBoard.new
    assert_equal computer_board.c_row, {:C => "C", :C1 => " ", :C2 => " ", :C3 => " ", :C4 => " "}
  end

  def test_computer_board_has_d_row
    computer_board = ComputerBoard.new
    assert_equal computer_board.d_row, {:D => "D", :D1 => " ", :D2 => " ", :D3 => " ", :D4 => " "}
  end

  def test_computer_shot_number_is_zero_at_start
    computer_board = ComputerBoard.new
    assert_equal 0, computer_board.player_shot_number
  end

  def test_computer_can_place_two_unit_group
    computer_board = ComputerBoard.new
    assert_equal computer_board.two_unit_computer_group_placement, computer_board.display_board
  end

  def test_computer_can_place_three_unit_group
    computer_board = ComputerBoard.new
    assert_equal computer_board.three_unit_computer_group_placement, "\n\nThe Enemy has placed their groups!\n\n"
  end

  def test_computer_can_place_both_groups
    computer_board = ComputerBoard.new
    computer_board.two_unit_computer_group_placement
    computer_board.three_unit_computer_group_placement
    refute computer_board.computer_groups_killed?
  end

  def test_computer_board_can_validate_two_unit_coords
    computer_board = ComputerBoard.new
    assert computer_board.computer_two_unit_valid?([:A2, :B2])
    refute computer_board.computer_two_unit_valid?([:A3, :C2])
  end

  def test_computer_board_can_validate_three_unit_coords
    computer_board = ComputerBoard.new
    assert computer_board.computer_three_unit_valid?([:C1, :C3])
    refute computer_board.computer_three_unit_valid?([:D2, :A4])
  end

  def test_computer_cannot_place_a_third_group
    computer_board = ComputerBoard.new
    computer_board.two_unit_computer_group_placement
    computer_board.three_unit_computer_group_placement
    refute computer_board.computer_second_group_valid?(computer_board.three_ship_computer_coords)
  end

  def test_place_player_shot
    computer_board = ComputerBoard.new
    player = Player.new
    assert_equal computer_board.place_player_shot(:A4, player), computer_board.player_shot_number
  end

end
