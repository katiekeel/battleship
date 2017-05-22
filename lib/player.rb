require './lib/board.rb'
require './lib/battleship.rb'

class Player

  attr_accessor :shoot, :ship_placement

  def get_coords(coords = gets.chomp)
    coords = coords.gsub(/\s+/, "").scan(/../)
    coords = coords.map {|coord| coord.to_sym}
    coords
  end

  def ship_placement
    get_coords
  end

  def shoot(coords)
    get_coords(coords)
  end

end
