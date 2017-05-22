require './lib/player.rb'
require './lib/board.rb'

class Battleship

  attr_accessor :player

  def initialize
    @player = Player.new
    @computer_board = Board.new
    @player_board = Board.new
  end
  #
  def start
    opening_sequence
    play
    computer_board.computer_ship_placement
    player_board.player_ship_placement
  end

  def opening_sequence
    puts "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
    "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
  end

  def play(input = gets.chomp)
    if input == "f"
      puts "Please enter the coordinates you wish to fire upon."
      player.shoot(coords = gets.chomp)
    elsif input == "l"
      instructions
    elsif input == "d"
      coward_quit
    else
      invalid_input
    end
  end

  def instructions
    puts "The Dark Lord has positioned his largest orc battalion upon the Plateau of Gorgoroth. We will shoot flaming arrows into their area; we will rejoice in their screams if they are hit, and shoot again if we miss, until they are destroyed!\n\n"
    puts "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A4 B2"
    "To kill these foul orcs, command your men to fire on their position using coordinates, such as: A4 B2"
  end

  def coward_quit
    puts "You are a coward and a traitor to Middle Earth. Good riddance."
    "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def invalid_input
    puts "Please decide what you would like to do."
    "Please decide what you would like to do."
  end

  def player_ship_placement
    puts "Place your men in formation on the field. You have one group of men spanning two units, and one group of men spanning three units."
    puts "Please enter your first placement of two units. Example: A2 B4"
    player.ship_placement
    player_board.player_ship_placement
    puts "Please enter your second placement of three units. Example: A1 B1 C1"
  end


end
