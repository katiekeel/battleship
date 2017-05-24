module Board

  def display_board
    display_board = [
      @equals_nums_rows[:top_equals_row].rjust(50),
      @equals_nums_rows[:nums_row].rjust(50),
      @a_row.values.join("   ").rjust(50),
      @b_row.values.join("   ").rjust(50),
      @c_row.values.join("   ").rjust(50),
      @d_row.values.join("   ").rjust(50),
      @equals_nums_rows[:bottom_equals_row].rjust(50)
    ]
  end

  def game_board
    game_board = [@a_row, @b_row, @c_row, @d_row]
  end


    def place_two_unit_group(coords)
      coords.each do |coord|
        game_board.each do |item|
          item[coord] = "X" if item.key?(coord)
        end
      end
    end
