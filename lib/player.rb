class Player

  attr_accessor :shoot, :group_placement

  def get_coords(coords = gets.chomp)
    coords = coords.gsub(/\s+/, "").scan(/../)
    coords_to_upcase(coords)
    upcase_coords = coords.map {|coord| coord.to_sym}
    upcase_coords
  end

  def coords_to_upcase(coords)
    upcase_coords = coords.map do |coord|
      coord[0] = coord[0].upcase
      coord[1] = coord[1]
    end
    upcase_coords
  end

  def enter_group
    get_coords
  end

end
