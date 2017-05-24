require 'pry'
require './lib/board.rb'

computer_board = Board.new
player_board = Board.new
player = Player.new

# binding.pry
computer_board.two_unit_computer_group_placement
computer_board.three_unit_computer_group_placement
puts computer_board.display_board
puts computer_board
