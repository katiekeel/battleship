require 'pry'
require './lib/player.rb'
require './player_board.rb'
require './computer_board.rb'

computer_board = ComputerBoard.new
player_board = PlayerBoard.new
player = Player.new

# binding.pry
computer_board.two_unit_computer_group_placement
computer_board.three_unit_computer_group_placement
puts computer_board.display_board
puts computer_board
