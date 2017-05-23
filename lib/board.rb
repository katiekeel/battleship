require './lib/player.rb'
require './lib/battleship.rb'
require 'pry'

class Board

  attr_reader :equals_nums_rows, :a_row, :b_row, :c_row, :d_row

  attr_accessor :game_board, :display_board

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
  end

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


    def two_unit_player_ship_placement(player)
      coords = player.enter_ship
      if two_unit_valid?(coords)
        coords.each do |coord|
          game_board.each do |item|
            item[coord] = "X" if item.key?(coord) && item[coord] != "X"
          end
        end
      else
        puts "Invalid coords, try again"
        two_unit_player_ship_placement(player)
      end
      display_board
    end

  def two_unit_computer_ship_placement
    coords = get_random_keys.sample(2)
    until two_unit_valid?(coords)
      coords = get_random_keys.sample(2)
    end
    coords.each do |coord|
      game_board.each do |item|
        if item.key?(coord)
          item[coord] = "X"
        end
      end
    end
    display_board
  end


    def get_random_keys
      random_keys = []
      game_board.each do |thing|
        next if thing.is_a? String
        random_keys << thing.keys
      end
      random_keys.map! do |item|
        item.drop_while do |thing|
          thing == :A || thing == :B || thing == :C || thing == :D
        end
      end
      random_keys.map! do |item|
        item.sample
      end
      random_keys
    end

  def two_unit_valid?(coords)
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
      if second_coord[1] == first_coord[1]
        true
      else
        false
      end
    else
      false
    end
  end

  def player_three_unit_valid?(coords)
    first_coord = coords[0]
    second_coord = coords[1]
    # binding.pry
    if first_coord.nil? || second_coord.nil?
      puts "Please enter valid and complete coordinates for a three-unit ship, in order."
      false
    elsif first_coord[1].to_i > second_coord[1].to_i
      puts "Please enter your coordinates in letter and number order, such as: A1 C1, not C1 A1"
      false
    elsif first_coord[0].ord > second_coord[0].ord
      puts "Please enter your coordinates in letter and number order, such as: A1 C1, not C1 A1"
      false
    elsif first_coord[0] == second_coord[0]
      player_second_ship_valid?(coords) if second_coord[1].to_i == first_coord[1].to_i - 2 || second_coord[1].to_i == first_coord[1].to_i + 2
    elsif second_coord[0].ord == first_coord[0].ord + 2
      player_second_ship_valid?(coords) if second_coord[1] == first_coord[1]
    else
      puts "Please enter valid and complete coordinates for a three-unit ship."
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
      computer_second_ship_valid?(coords) if second_coord[1].to_i == first_coord[1].to_i - 2 || second_coord[1].to_i == first_coord[1].to_i + 2
    elsif second_coord[0].ord == first_coord[0].ord + 2
      computer_second_ship_valid?(coords) if second_coord[1] == first_coord[1]
    else
      false
    end
  end

  def player_second_ship_valid?(coords)
    # Iterate through game_board hash and check if keys corresponding to coords have value of x
    coords.each do |coord|
      game_board.each do |row|
        if row[coord] == "X"
          puts "There is already a ship placed at one of these coordinates; please try again."
          return false
        else
          true
        end
      end
    end
  end

  def computer_second_ship_valid?(coords)
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

  def three_unit_computer_ship_placement
    coords = get_random_keys.sample(2)
    until computer_three_unit_valid?(coords)
      coords = get_random_keys.sample(2)
    end
    coords.each do |coord|
      game_board.each do |item|
        if item.key?(coord)
          item[coord] = "X"
        end
      end
    end
  # binding.pry
  same_row(coords)
  same_column(coords)

  display_board
  end

  def three_unit_player_ship_placement(player)
    coords = player.enter_ship
    # binding.pry
    if player_three_unit_valid?(coords)
      # Insert 1st X at 1st coord
      # Insert last x at 2nd coord
      coords.each do |coord|
        game_board.each do |item|
          if item.key?(coord)
            item[coord] = "X"
          end
        end
      end
    else
      three_unit_player_ship_placement(player)
    end
    # binding.pry
    same_row(coords)
    same_column(coords)

    display_board
  end

  def same_row(coords)
    if coords[0][0] == coords[1][0]
      coord = ""
      coord << coords[0][0]
      coord_num = coords[0][1].to_i + 1
      coord += coord_num.to_s
      coord = coord.to_sym
    end

    game_board.each do |item|
      if item.key?(coord)
        item[coord] = "X"
      end
    end
  end

  def same_column(coords)
    if coords[0][0].ord + 2 == coords[1][0].ord
      coord = ""
      coord << coords[0][0].ord + 1
      coord += coords[0][1]
      coord = coord.to_sym
    end
    game_board.each do |item|
      if item.key?(coord)
        item[coord] = "X"
      end
    end
  end

end
