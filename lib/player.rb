class Player

  attr_reader :coords

  attr_accessor :shoot

  def shoot(coords)
    coords = coords.gsub(/\s+/m, ' ').strip.split("")
    coords
  end

end
