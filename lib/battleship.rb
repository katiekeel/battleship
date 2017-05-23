require './lib/board.rb'
require './lib/player.rb'
require 'pry'

class Battleship

  attr_accessor :player, :computer_board, :player_board

  def initialize
    @player = Player.new
    @computer_board = Board.new
    @player_board = Board.new
  end

  def start
    opening_sequence
    play
    computer_board.computer_ship_placement
    player_board.player_ship_placement
  end

  def opening_sequence
    puts "\n\n\n\n"
    puts "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
    puts "\n\n"
    "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
  end

  def play(input = gets.chomp)
    puts "\n\n\n\n"
    if input == "f"
      computer_ship_placement
      player_ship_placement
    elsif input == "l"
      instructions
    elsif input == "d"
      coward_quit
    else
      invalid_input
    end
  end

  def instructions
    puts "\n\n"
    puts "===== INSTRUCTIONS ====="
    puts "\n"
    puts "The Dark Lord has positioned his largest orc battalion upon the Plateau of Gorgoroth. We will shoot flaming arrows into their area; we will rejoice in their screams if they are hit, and shoot again if we miss, until they are destroyed!\n\n"
    puts "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A1 B1"
    puts "\n\n"
    puts "========================"
    puts "\n"
    # return "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A1 B1"
    opening_sequence
    play
  end

  def coward_quit
    puts "\n\n\n"
    puts "You are a coward and a traitor to Middle Earth. Good riddance."
    "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def invalid_input
    puts "\n\n\n"
    puts "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war."
    return "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war."
    play
  end

  def computer_ship_placement
    @computer_board.two_unit_computer_ship_placement
    @computer_board.three_unit_computer_ship_placement
  end

  def player_ship_placement
    puts "Place your men in formation on the field. You have one group of men spanning two units, and one group of men spanning three units."
    puts "\n\n"
    puts "Here is a map of the field:"
    puts @player_board.display_board
    puts "Please enter your first placement of two units. Example: A1 B1"
    puts "\n"
    @player_board.two_unit_player_ship_placement(@player)
    puts "\n\n"
    puts "Here is your two-unit placement:"
    puts @player_board.display_board
    puts "\n\n"
    puts "Please enter your second placement of three units. Example: C1 C3"
    puts "\n"
    @player_board.three_unit_player_ship_placement(@player)
    puts "\n\n"
    puts "Here is your three-unit battalion placement:"
    puts "\n\n"
    @player_board.display_board
    puts "\n\n\n"
    puts @player_board.display_board
    puts "\n\n"
  end


end
