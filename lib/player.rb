class Player

  attr_reader :coords

  attr_accessor :shoot

  def shoot
    puts "Please enter the coordinates you wish to fire upon."
    coords = gets.chomp
    coords = coords.gsub(/\s+/m, ' ').strip.split("")
    coords
  end

end
