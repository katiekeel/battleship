require 'pry'
require './lib/battleship.rb'

game = Battleship.new
game.opening_sequence
game.play
