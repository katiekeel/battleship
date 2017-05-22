require './lib/player.rb'
require './lib/battleship.rb'
require 'pry'

class Board

  attr_reader :equals_nums_rows, :a_row, :b_row, :c_row, :d_row

  attr_accessor :computer_game_board, :player_game_board

  def initialize

    @equals_nums_rows = {
        :top_equals_row => ["=", "=", "=", "=", "="].join(""),
        :nums_row => [".", 1, 2, 3, 4].join(""),
        :bottom_equals_row => ["=", "=", "=", "=", "="].join("")
    }

    @a_row = {:A => "A", :A1 => " ", :A2 => " ", :A3 => " ", :A4 => " "}

    @b_row = {:B => "B", :B1 => " ", :B2 => " ", :B3 => " ", :B4 => " "}

    @c_row = {:C => "C", :C1 => " ", :C2 => " ", :C3 => " ", :C4 => " "}

    @d_row = {:D => "D", :D1 => " ", :D2 => " ", :D3 => " ", :D4 => " "}
  end

  def computer_game_board
    computer_game_board = [
      @equals_nums_rows[:top_equals_row],
      @equals_nums_rows[:nums_row],
      @a_row,
      @b_row,
      @c_row,
      @d_row,
      @equals_nums_rows[:bottom_equals_row]
    ]
  end

  def computer_display_board
    computer_display_board = [
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
      @a_row,
      @b_row,
      @c_row,
      @d_row
    ]
  end

  def player_display_board
    player_display_board = [
      @equals_nums_rows[:top_equals_row],
      @equals_nums_rows[:nums_row],
      @a_row.values.join(""),
      @b_row.values.join(""),
      @c_row.values.join(""),
      @d_row.values.join(""),
      @equals_nums_rows[:bottom_equals_row]
    ]
  end

  def computer_ship_placement
    coords = get_random_keys.map do |item|
      item.sample
    end
    coords = coords.sample(2)
    # binding.pry
    until valid?(coords)
      coords = []
    get_random_keys.each do |item|
      coords << item.sample unless coords.length == 2
    end
    end
    coords.each do |coord|
      computer_game_board.each do |item|
        next if item.is_a? String
        if item.key?(coord)
          item[coord] = "X"
        end
      end
    end
    puts computer_display_board
    computer_display_board
  end

  def valid?(coords)
    first_coord = coords[0]
    second_coord = coords[1]
    # check coord string vs index 0 & 1 of key
    # binding.pry
    if first_coord.nil? || second_coord.nil?
      false
    elsif first_coord[0] == second_coord[0]
      true if second_coord[1].to_i == first_coord[1].to_i - 1 || first_coord[1].to_i + 1
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

  def get_random_keys
    random_keys = []
    computer_game_board.each do |thing|
      next if thing.is_a? String
      random_keys << thing.keys
    end
    random_keys.map! do |item|
      item.drop_while do |thing|
        thing == :A || thing == :B || thing == :C || thing == :D
      end
    end
    random_keys
  end

  def two_unit_player_ship_placement(player)
    coords = player.ship_placement
    binding.pry
    if valid?(coords)
      coords.each do |coord|
        player_game_board.each do |item|
          item[coord] = "X" if item.key?(coord) && item[coord] != "X"
        end
      end
    else
      puts "Invalid coords, try again"
      two_unit_player_ship_placement(player)
    end
    puts player_display_board
  end


end
