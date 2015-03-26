class Board
  attr_reader :cells

  def initialize
    set_grid
  end

  def place(ship, coords)
    @cells[coords] = ship
  end

  def takes_hit(coords)
    if cells[coords].nil? || cells[coords] == :miss
      cells[coords] = :miss
    else
      cells[coords].hit
    end
  end

  def set_grid
    @cells = { 'A1' => nil }
  end
end
