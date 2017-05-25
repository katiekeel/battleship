require './lib/board_module.rb'
require './lib/player_board.rb'

class ComputerBoard

  include Board

  attr_reader :equals_nums_rows,
              :a_row,
              :b_row,
              :c_row,
              :d_row,
              :two_ship_computer_coords,
              :three_ship_computer_coords,
              :player_shot_number,
              :game_timer

  def initialize

    @equals_nums_rows = {
        :top_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join(""),
        :nums_row => [".", 1, 2, 3, 4].join("   "),
        :bottom_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join("")
    }

    @a_row = {:A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "}

    @b_row = {:B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "}

    @c_row = {:C => "C", :C1 => " ", :C2 => " ", :C3 => " ", :C4 => " "}

    @d_row = {:D => "D", :D1 => " ", :D2 => " ", :D3 => " ", :D4 => " "}

    @player_view_equals_nums_rows = {
       :top_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join(""),
       :nums_row => [".", 1, 2, 3, 4].join("   "),
       :bottom_equals_row => ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="].join("")

     }

    @player_view_a_row = {:A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "}

    @player_view_b_row = {:B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "}

    @player_view_c_row = {:C => "C", :C1 => " ", :C2 => " ", :C3 => " ", :C4 => " "}

    @player_view_d_row =  {:D => "D", :D1 => " ", :D2 => " ", :D3 => " ", :D4 => " "}

    @player_shot_number = 0

    @game_timer = Time.now

  end


  def two_unit_computer_group_placement
    coords = get_random_keys.flatten.sample(2)
    coords = get_random_keys.flatten.sample(2) until computer_two_unit_valid?(coords)
    @two_ship_computer_coords = coords
    place_two_unit_group(coords)
  end


  def computer_two_unit_valid?(coords)
    first_coord = coords[0]
    second_coord = coords[1]
    if first_coord.nil? || second_coord.nil?
      false
    elsif first_coord[0] == second_coord[0]
      true if second_coord[1].to_i == first_coord[1].to_i - 1 || second_coord[1].to_i == first_coord[1].to_i + 1
    elsif second_coord[0].ord == first_coord[0].ord + 1
      if second_coord[1] == first_coord[1]
       true
      else
        false
      end
    elsif second_coord[0].ord == first_coord[0].ord - 1
        false
    else
      false
    end
  end

  def computer_three_unit_valid?(coords)
    first_coord = coords[0]
    second_coord = coords[1]
    # binding.pry
    if first_coord.nil? || second_coord.nil?
      false
    elsif first_coord[1].to_i > second_coord[1].to_i
      false
    elsif first_coord[0].ord > second_coord[0].ord
      false
    elsif first_coord[0] == second_coord[0]
      computer_second_group_valid?(coords) if second_coord[1].to_i == first_coord[1].to_i - 2 || second_coord[1].to_i == first_coord[1].to_i + 2
    elsif second_coord[0].ord == first_coord[0].ord + 2
      computer_second_group_valid?(coords) if second_coord[1] == first_coord[1]
    else
      false
    end
  end

  def computer_second_group_valid?(coords)
    coords.each do |coord|
      game_board.each do |row|
        if row[coord] == "X"
          return false
        else
          true
        end
      end
    end
  end

  def three_unit_computer_group_placement
    coords = get_random_keys.flatten.sample(2)
    until computer_three_unit_valid?(coords)
      coords = get_random_keys.flatten.sample(2)
    end
    @three_ship_computer_coords = coords
    coords.each do |coord|
      game_board.each do |item|
        if item.key?(coord)
          item[coord] = "X"
        end
      end
    end
    same_row(coords) if coords[0][0] == coords[1][0]
    same_column(coords) if coords[0][0].ord + 2 == coords[1][0].ord && coords[0][0] != coords[1][0]
  end


  def player_shoot(player)
    puts "\n\nEnter a coordinate to shoot at, captain!\n\n"
    coord = player.get_coords
    coord = coord[0]
    place_player_shot(coord, player)
  end

  def place_player_shot(coord, player)
    row_counter = -1
    game_board.each do |row|
      row_counter += 1
      if row.key?(coord)
        if row[coord] == "X"
          if player_shot_game_board[row_counter][coord] == "M" || player_shot_game_board[row_counter][coord] == "H"
            puts "\n\nLiege, you have already shot in that location! Please try again.\n\n"
            player_shoot(player)
          else
            player_shot_game_board[row_counter][coord] = "H"
            puts "\n\nYou have struck an orc, valiant captain!\n\n"
            puts player_shot_display_board
          end
        elsif row[coord] == " "
          if player_shot_game_board[row_counter][coord] == "M" || player_shot_game_board[row_counter][coord] == "H"
            puts "\n\nLiege, you have already shot in that location! Please try again.\n\n"
            player_shoot(player)
          else
            player_shot_game_board[row_counter][coord] = "M"
            puts "\n\nSadly, lord, you have missed.\n\n"
            puts player_shot_display_board
          end
        end
      end
    end
    @player_shot_number += 1
  end

  def player_shot_game_board
    player_shot_game_board = [
      @player_view_a_row,
      @player_view_b_row,
      @player_view_c_row,
      @player_view_d_row
    ]
  end

  def player_shot_display_board
    player_shot_display_board = [
      @player_view_equals_nums_rows[:top_equals_row].rjust(50),
      @player_view_equals_nums_rows[:nums_row].rjust(50),
      @player_view_a_row.values.join("   ").rjust(50),
      @player_view_b_row.values.join("   ").rjust(50),
      @player_view_c_row.values.join("   ").rjust(50),
      @player_view_d_row.values.join("   ").rjust(50),
      @player_view_equals_nums_rows[:bottom_equals_row].rjust(50)
    ]
  end

  def computer_two_group_killed?
    sunk_counter = 0
    @two_ship_computer_coords.each do |coord|
      player_shot_game_board.each do |row|
        if row.key?(coord)
          sunk_counter += 1 if row[coord] == "H"
        end
      end
    end

    if sunk_counter == 2
      return true
    else
      return false
    end
  end

  def computer_three_group_killed?
    sunk_counter = 0
    coords = @three_ship_computer_coords
    coords.each do |coord|
      player_shot_game_board.each do |row|
        if row.key?(coord)
          sunk_counter += 1 if row[coord] == "H"
        end
      end
    end

    if coords[0][0] == coords[1][0]
      sunk_counter += 1 if computer_same_row_killed(coords) == true
    elsif coords[0][0].ord + 2 == coords[1][0].ord && coords[0][0] != coords[1][0]
      sunk_counter += 1 if computer_same_column_killed(coords) == true
    end

    if sunk_counter == 3
      return true
    else
      return false
    end
  end

  def computer_same_row_killed(coords)
    if coords[0][0] == coords[1][0]
      coord = ""
      coord << coords[0][0]
      coord_num = coords[0][1].to_i + 1
      coord += coord_num.to_s
      coord = coord.to_sym
    end

    player_shot_game_board.each do |item|
      if item.key?(coord)
        return true if item[coord] == "H"
      end
    end
  end

  def computer_same_column_killed(coords)
    if coords[0][0].ord + 2 == coords[1][0].ord
      coord = ""
      coord << coords[0][0].ord + 1
      coord += coords[0][1]
      coord = coord.to_sym
    end

    player_shot_game_board.each do |item|
      if item.key?(coord)
        return true if item[coord] == "H"
      end
    end
  end

  def computer_groups_killed?
    true if self.computer_two_group_killed? && self.computer_three_group_killed?
  end

end
