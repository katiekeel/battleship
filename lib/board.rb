class Board

  attr_reader :equals_nums_rows, :a_row, :b_row, :c_row, :d_row

  attr_accessor :computer_game_board, :player_game_board

  def initialize

    @equals_nums_rows = {
        :top_equals_row => ["=", "=", "=", "=", "="].join(""),
        :nums_row => [".", 1, 2, 3, 4].join(""),
        :bottom_equals_row => ["=", "=", "=", "=", "="].join("")
    }

    @a_row = {
      :A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "
    }

    @b_row = {
      :B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "
    }

    @c_row = {
      :C => "C", :C1 => " ", :C2 => " ", :C3 => " ", :C4 => " "
    }

    @d_row = {
      :D => "D", :D1 => " ", :D2 => " ", :D3 => " ", :D4 => " "
    }
  end

  def computer_game_board
    computer_game_board = [
      @equals_nums_rows[:top_equals_row],
      @equals_nums_rows[:nums_row],
      @a_row.values,
      @b_row.values,
      @c_row.values,
      @d_row.values,
      @equals_nums_rows[:bottom_equals_row]
    ]
  end

  def display_computer_board
    computer_game_board = [
      @equals_nums_rows[:top_equals_row],
      @equals_nums_rows[:nums_row],
      @a_row.values.join(""),
      @b_row.values.join(""),
      @c_row.values.join(""),
      @d_row.values.join(""),
      @equals_nums_rows[:bottom_equals_row]
    ]
  end

  def player_game_board
    player_game_board = [
      @equals_nums_rows[:top_equals_row],
      @equals_nums_rows[:nums_row],
      @a_row,
      @b_row,
      @c_row,
      @d_row,
      @equals_nums_rows[:bottom_equals_row]
    ]
  end

  def computer_ship_placement
    coords = computer_game_board[2..5].keys.sample
    placed_board = computer_game_board[2..5].map do |pair|
      pair.each do |key, value|
        coords.each do |coord|
          if coord == key
            value = "X"
          end
        end
      end
    end
  end

  def player_ship_placement
  end



end
