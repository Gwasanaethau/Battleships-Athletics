class Board
  DEFAULT_GRID = { 'A1' => nil }
  attr_reader :cells

  def initialize
    @cells = DEFAULT_GRID
  end

  def place(ship, coords)
    @cells[coords] = ship
  end

  def takes_hit(coords)
    if cells[coords].nil? || cells[coords] == 'miss'
      cells[coords] = 'miss'
    else
      cells[coords].hit
    end
  end
end

