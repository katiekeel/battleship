class Player

  attr_reader :coords

  attr_accessor :shoot

  def ship_placement
  end


  def shoot(coords)
    coords = coords.gsub(/\s+/, "").scan(/../)
    coords
  end

end
