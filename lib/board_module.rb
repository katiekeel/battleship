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
      coords
    end


    def same_row(coords)
      if coords[0][0] == coords[1][0]
        coord = ""
        coord << coords[0][0]
        coord_num = coords[0][1].to_i + 1
        coord += coord_num.to_s
        coord = coord.to_sym
      end
      coord
    end

    def place_same_row(coords)
      coord = same_row(coords)
      place_two_unit_group([coord])
    end

    def same_column(coords)
      if coords[0][0].ord + 2 == coords[1][0].ord
        coord = ""
        coord << coords[0][0].ord + 1
        coord += coords[0][1]
        coord = coord.to_sym
      end
    end

    def place_same_column(coords)
      coord = same_column(coords)
      place_two_unit_group([coord])
    end


  def get_random_keys
    random_keys = []
    game_board.each do |thing|
      next if thing.is_a? String
      random_keys << thing.keys
    end
    delete_invalid_keys(random_keys)
  end

  def delete_invalid_keys(random_keys)
    random_keys.map! do |item|
      item.drop_while do |key|
        key == :A || key == :B || key == :C || key == :D
      end
    end
    valid_random_keys(random_keys)
  end

  def valid_random_keys(random_keys)
    random_keys.map! do |item|
      item.sample(2)
    end
    random_keys
  end

  def check_middle_coord(coord)
    game_board.each do |row|
      if row[coord] == "X"
        return false
      end
    end
  end

  def two_sunk?(sunk_counter)
    if sunk_counter == 2
      return true
    else
      return false
    end
  end

  def three_sunk?(sunk_counter)
    if sunk_counter == 3
      return true
    else
      return false
    end
  end


end
