require './lib/computer_board.rb'
require './lib/player.rb'
require 'pry'

class BattleOrcs

  attr_accessor :player,
                :computer_board,
                :player_board,
                :game_timer,
                :player_two_already_killed,
                :player_three_already_killed,
                :computer_two_already_killed,
                :computer_three_already_killed

  def initialize
    @player = Player.new
    @computer_board = ComputerBoard.new
    @player_board = PlayerBoard.new
    @computer_two_already_killed = false
    @computer_two_already_killed = false
    @player_two_already_killed = false
    @player_three_already_killed = false
  end

  def start
    opening_sequence
    play
    end_sequence
  end

  def opening_sequence
    puts "\n\n\n\n"
    puts "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
    puts "\n\n"
    "You have been asked to command a battalion of the allied races of Middle Earth against the Dark Lord Sauron. Would you like to (f)ight in the battle, (l)isten to your captain's orders, or (d)esert the battle as a cowardly traitor?"
  end

  def play(input = gets.chomp)
    puts "\n\n\n\n"
    if input == "f" || input == "F"
      computer_group_placement
      player_group_placement
      shoot
    elsif input == "l" || input == "L"
      instructions
    elsif input == "d" || input == "D"
      coward_quit
    else
      invalid_input
    end
  end

  def instructions
    puts "===== INSTRUCTIONS ====="
    puts "\n"
    puts "The Dark Lord has positioned his largest orc battalion upon the Plateau of Gorgoroth. We will shoot flaming arrows into their area; we will\nrejoice in their screams if they are hit, and shoot again if we miss, until they are destroyed!\n\n"
    puts "To kill these foul orcs, command your men to fire on their position using single coordinates, such as: A1.\n\n"
    puts "You, captain, will have one group of men spanning two units, and one group of men spanning three units.\n\n"
    puts "To place a group of men, enter their starting and ending coordinates. For example, a two unit group might be at A1 B1, or at B3 C3. Groups\nmay not be placed diagonally nor wrap to opposite sides of the field.\n\n"
    puts "A three unit group might be placed at C1 C3, or A1 A3. If you have previously placed a group in one of these coordinates, you may not place\nanother group there.\n\n"
    puts "You and the Enemy will take turns firing missiles at the other; whoever destroys all of the other's men first wins the battle!\n\n"
    puts "\n"
    puts "========================"
    opening_sequence
    play
  end

  def coward_quit
    puts "\n"
    puts "You are a coward and a traitor to Middle Earth. Good riddance.\n\n\n"
    "You are a coward and a traitor to Middle Earth. Good riddance."
  end

  def invalid_input
    puts "Please decide what you would like to do: (f)ight, (l)isten to instructions, or (d)esert the war.\n\n"
    play
  end

  def computer_group_placement
    @computer_board.two_unit_computer_group_placement
    @computer_board.three_unit_computer_group_placement
  end

  def player_group_placement
    puts "\n\nThe Enemy is in position! We must ready our attack!\n\n"
    puts "\n\nPlace your men in formation on the field. You have one group of men spanning two units, and one group of men spanning three units.\n\n"
    puts "\n\n"
    puts "Here is a map of the field:"
    puts "\n\n"
    puts @player_board.display_board
    puts "\n\n"
    puts "Please enter your first placement of two units. Example: A1 B1"
    puts "\n"
    @player_board.two_unit_player_group_placement(@player)
    puts "\n\n"
    puts "Here is your two-unit placement:\n\n"
    puts @player_board.display_board
    puts "\n\n"
    puts "Please enter your second placement of three units. Example: C1 C3"
    puts "\n"
    # binding.pry
    @player_board.three_unit_player_group_placement(@player)
    puts "\n\n"
    puts "Here is your three-unit battalion placement:"
    puts "\n\n"
    @player_board.display_board
    puts "\n\n\n"
    puts @player_board.display_board
    puts "\n\n"
    puts "Prepare to fight!\n\n\n"
  end

  def shoot
    puts "\n\nWe shall strike first! Forth to victory!\n\n"
    until @computer_board.computer_groups_killed? || @player_board.player_groups_killed?
      @computer_board.player_shoot(player) unless @player_board.player_groups_killed?
      check_if_group_killed
      puts "Lord, press ENTER to end your turn."
      input = gets
      if input == "\n"
        @player_board.computer_shoot unless @computer_board.computer_groups_killed?
        check_if_group_killed
      else
        puts "Lord, PLEASE PRESS ENTER to end your turn."
        input = gets
      end
    end
  end

  def check_if_group_killed
    if @player_board.player_two_group_killed?
      unless @player_two_already_killed == true
        puts "\n\nMy liege, they have destroyed our two-unit group! We must hasten to victory!\n\n"
        @player_two_already_killed = true
      end
    elsif @player_board.player_three_group_killed?
      unless @player_three_already_killed == true
        puts "\n\nMy liege, they have destroyed our three-unit group! We must hasten to victory!\n\n"
        @player_three_already_killed = true
      end
    elsif @computer_board.computer_two_group_killed?
      unless @computer_two_already_killed == true
        puts "\n\nCaptain, we are victorious over the Enemy's two-unit battalion! Let us march on toward victory!\n\n"
        @computer_two_already_killed = true
      end
    elsif @computer_board.computer_three_group_killed?
      unless @computer_three_already_killed == true
        puts "\n\nCaptain, we are victorious over the Enemy's three-unit battalion! Let us march on toward victory!\n\n"
        @computer_three_already_killed = true
      end
    end
  end

  def end_sequence
    if @computer_board.computer_groups_killed?
      puts "\n\nVICTORY! Victory this day against the accursed Enemy.\n\n"
      puts "\n\nCaptain, your efforts required #{@computer_board.player_shot_number} missiles this day."
      puts "\n\nThe battle was fought for #{self.game_timer}."
    elsif @player_board.player_groups_killed?
      puts "\n\nAlas, Middle Earth has fallen to the Enemy.\n\n"
      puts "\n\n The Enemy required #{@player_board.computer_shot_number} missiles to defeat us."
      puts "\n\nThe battle was fought for #{self.game_timer}."
    end
  end

  def game_timer
    timer = Time.now - @computer_board.game_timer
    game_timer = Time.at(timer).utc.strftime("%H:%M:%S")
  end

end
