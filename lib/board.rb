class Board
  attr_reader :cells

  def initialize
    set_grid
  end

  def place(ship, coords)
    cells[coords] = ship
  end

  def takes_hit(coords)
    fail 'Cell already hit' if cells[coords] == :miss
    return cells[coords] = :miss if cells[coords].nil?
    fail 'Ship already hit' if cells[coords].sunk?
    cells[coords].hit
  end

  def won?
    floating_ships.empty?
  end

  private

  def set_grid
    @cells = { 'A1' => nil }
  end

  def floating_ships
    grid = @cells.values
    grid.keep_if { |value| value.is_a? Ship }
    grid.keep_if { |ship| !ship.sunk? }
  end
end
