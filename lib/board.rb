class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  def place(ship, coords)
    @cells[coords] = ship
  end

  def takes_hit(coords)
    @cells[coords].hit
  end
end
