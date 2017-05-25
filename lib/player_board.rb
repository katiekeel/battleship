require './lib/board_module.rb'
require './lib/player.rb'

class PlayerBoard

  include Board

  attr_reader :equals_nums_rows,
              :a_row,
              :b_row,
              :c_row,
              :d_row,
              :two_ship_player_coords,
              :three_ship_player_coords,
              :computer_shot_number

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

    @computer_shot_number = 0

  end

    def two_unit_player_group_placement(player, coords = player.enter_group)
      @two_ship_player_coords = coords
      if player_two_unit_valid?(coords)
        place_two_unit_group(coords)
      else
        return false
        two_unit_player_group_placement(player)
      end
      return coords
    end

    def player_two_unit_valid?(coords)
      first_coord = coords[0]
      second_coord = coords[1]
      if first_coord.nil? || second_coord.nil?
        puts "\n\nPlease enter complete and correct starting and ending coordinates for a two unit group, such as: A1 B1\n\n"
        false
      elsif first_coord[0] == second_coord[0]
        if second_coord[1].to_i == first_coord[1].to_i - 1 || second_coord[1].to_i == first_coord[1].to_i + 1
          true
        else
          puts "\n\nPlease enter complete and correct starting and ending coordinates for a two unit group, such as: A1 B1\n\n"
          false
        end
      elsif second_coord[0].ord == first_coord[0].ord + 1
        if second_coord[1] == first_coord[1]
         true
        else
          puts "\n\nPlease enter complete and correct starting and ending coordinates for a two unit group, such as: A1 B1\n\n"
          false
        end
      elsif second_coord[0].ord == first_coord[0].ord - 1
          puts "\n\nPlease enter complete and correct starting and ending coordinates for a two unit group, such as: A1 B1\n\n"
          false
      else
        puts "\n\nPlease enter complete and correct starting and ending coordinates for a two unit group, such as: A1 B1\n\n"
        false
      end
    end


    def player_three_unit_valid?(coords)
      first_coord = coords[0]
      second_coord = coords[1]
      if first_coord.nil? || second_coord.nil?
        puts "\n\nPlease enter valid and complete coordinates for a three-unit group, in order.\n\n"
        return false
      elsif first_coord[1].to_i > second_coord[1].to_i
        puts "\n\nPlease enter your coordinates in letter and number order, such as: A1 C1, not C1 A1\n\n"
        return false
      elsif first_coord[0].ord > second_coord[0].ord
        puts "\n\nPlease enter your coordinates in letter and number order, such as: A1 C1, not C1 A1\n\n"
        return false
      elsif first_coord[0] == second_coord[0]
        player_second_group_valid?(coords) if second_coord[1].to_i == first_coord[1].to_i - 2 || second_coord[1].to_i == first_coord[1].to_i + 2
      elsif second_coord[0].ord == first_coord[0].ord + 2
        player_second_group_valid?(coords) if second_coord[1] == first_coord[1]
      else
        puts "\n\nPlease enter valid and complete coordinates for a three-unit group.\n\n"
        return false
      end

    end

    def player_second_group_valid?(coords)
      coords.each do |coord|
        game_board.each do |row|
          if row[coord] == "X"
            puts "\n\nThere is already a group placed at one of these coordinates; please try again.\n\n"
            return false
          else
            true
          end
        end
      end
    end

    def three_unit_player_group_placement(player, coords = player.enter_group)
      if player_three_unit_valid?(coords)
        coords.each do |coord|
          game_board.each do |item|
            if item.key?(coord)
              item[coord] = "X"
            end
          end
        end
        @three_ship_player_coords = coords
        same_row(coords) if coords[0][0] == coords[1][0]
        same_column(coords) if coords[0][0].ord + 2 == coords[1][0].ord && coords[0][0] != coords[1][0]
      else
        return false
        three_unit_player_group_placement(player)
      end
      coords
    end

    def computer_shoot
      coord = get_random_keys.flatten.sample(1)
      coord = coord[0]
      place_computer_shot(coord)
    end

    def place_computer_shot(coord)
      game_board.each do |row|
        if row.key?(coord)
          if row[coord] == "X"
            row[coord] = "H"
            puts "\n\nThe Enemy is preparing to fire; take cover!\n\n"
            puts "\n\nCurse the Enemy! The orcs have hit us!\n\n"
            puts display_board
          elsif row[coord] == " "
            row[coord] = "M"
            puts "\n\nThe Enemy is preparing to fire; take cover!\n\n"
            puts "\n\nBy the grace of Luthien, the foul orcs have missed us this turn.\n\n"
            puts display_board
          elsif row[coord] == "H" || row[coord] == "M"
            computer_shoot
          end
        end
      end
      @computer_shot_number += 1
      return @computer_shot_number
    end

    def player_two_group_killed?
      sunk_counter = 0
      @two_ship_player_coords.each do |coord|
        self.game_board.each do |row|
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


    def player_three_group_killed?
      sunk_counter = 0
      coords = @three_ship_player_coords
      coords.each do |coord|
        self.game_board.each do |row|
          if row.key?(coord)
            sunk_counter += 1 if row[coord] == "H"
          end
        end
      end

      if coords[0][0] == coords[1][0]
        sunk_counter += 1 if player_same_row_killed?(coords) == true
      elsif coords[0][0].ord + 2 == coords[1][0].ord && coords[0][0] != coords[1][0]
        sunk_counter += 1 if player_same_column_killed?(coords) == true
      end

      if sunk_counter == 3
        return true
      else
        return false
      end
    end

    def player_same_row_killed?(coords)
      if coords[0][0] == coords[1][0]
        coord = ""
        coord << coords[0][0]
        coord_num = coords[0][1].to_i + 1
        coord += coord_num.to_s
        coord = coord.to_sym
      end

      game_board.each do |item|
        if item.key?(coord)
          return true if item[coord] == "H"
        end
      end
    end

    def player_same_column_killed?(coords)
      if coords[0][0].ord + 2 == coords[1][0].ord
        coord = ""
        coord << coords[0][0].ord + 1
        coord += coords[0][1]
        coord = coord.to_sym
      end
      game_board.each do |item|
        if item.key?(coord)
          return true if item[coord] == "H"
        end
      end
    end

    def player_groups_killed?
      true if self.player_two_group_killed? && self.player_three_group_killed?
    end


end
