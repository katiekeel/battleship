require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_board.rb'

require 'pry'

class PlayerBoardTest < Minitest::Test

  def test_player_board_exists
    player_board = PlayerBoard.new
    assert_instance_of PlayerBoard, player_board
  end

  def test_player_board_has_game_board
    skip
    player_board = PlayerBoard.new
    assert_equal player_board.game_board, [@a_row, @b_row, @c_row, @d_row]
  end

  def test_player_board_has_display_board
    skip
    player_board = PlayerBoard.new
    binding.pry
    assert_equal player_board.display_board, [
      @equals_nums_rows[:top_equals_row].rjust(50),
      @equals_nums_rows[:nums_row].rjust(50),
      @a_row.values.join("   ").rjust(50),
      @b_row.values.join("   ").rjust(50),
      @c_row.values.join("   ").rjust(50),
      @d_row.values.join("   ").rjust(50),
      @equals_nums_rows[:bottom_equals_row].rjust(50)
    ]
  end

  def test_player_board_has_equals_and_nums_rows
    player_board = PlayerBoard.new
    assert_equal player_board.equals_nums_rows, {
        :top_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join(""),
        :nums_row => [".", 1, 2, 3, 4].join("   "),
        :bottom_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join("")
    }
  end

  def test_player_board_has_a_row
    player_board = PlayerBoard.new
    assert_equal player_board.a_row, {:A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "}
  end

  def test_player_board_has_b_row
    player_board = PlayerBoard.new
    assert_equal player_board.b_row, {:B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "}
  end

  def test_player_board_has_c_row
    player_board = PlayerBoard.new
  end

  def test_player_board_has_d_row
    player_board = PlayerBoard.new
  end

  def test_computer_shot_number_is_zero_at_start
    player_board = PlayerBoard.new
    assert_equal player_board.computer_shot_number, 0
  end

  def test_player_can_place_two_unit_group
    player_board = PlayerBoard.new
    player = Player.new
    assert_equal player_board.two_unit_player_group_placement(player, [:A2, :B2]), [:A2, :B2]
  end

  def test_player_can_place_three_unit_group
    player_board = PlayerBoard.new
    player = Player.new
    assert_equal player_board.three_unit_player_group_placement(player, [:C1, :C3]), [:C1, :C3]
  end

  def test_computer_can_shoot_at_player_board
    player_board = PlayerBoard.new
    assert_equal player_board.computer_shoot,
  end

end
