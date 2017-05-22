require './lib/player.rb'
require './lib/battleship.rb'
require 'pry'

class Board

  attr_reader :equals_nums_rows, :a_row, :b_row, :c_row, :d_row

  attr_accessor :game_board, :display_board

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

  def display_board
    display_board = [
      @equals_nums_rows[:top_equals_row],
      @equals_nums_rows[:nums_row],
      @a_row.values.join(""),
      @b_row.values.join(""),
      @c_row.values.join(""),
      @d_row.values.join(""),
      @equals_nums_rows[:bottom_equals_row]
    ]
  end

  def game_board
    game_board = [@a_row, @b_row, @c_row, @d_row]
  end


    def two_unit_player_ship_placement(player)
      coords = player.ship_placement
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
      puts display_board
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
    puts display_board
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

  def three_unit_valid?(coords)
    first_coord = coords[0]
    second_coord = coords[1]
    if first_coord.nil? || second_coord.nil?
      false
    elsif first_coord[0] == second_coord[0]
      if second_coord[1].to_i == first_coord[1].to_i - 2 || first_coord[1].to_i + 2
        true unless
    elsif second_coord[0].ord == first_coord[0].ord + 1
      if second_coord[1] == first_coord[1].to_i - 1
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

  def three_unit_computer_ship_placement
    coords = get_random_keys.sample(2)
    until three_unit_valid?(coords)
      coords = get_random_keys.sample(2)
    end
    coords.each do |coord|
      game_board.each do |item|
        if item.key?(coord)
          item[coord] = "X"
        end
      end
    end
    puts display_board
    display_board
  end

end
