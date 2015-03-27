class Board
  ALPHABET = "ABCDEFGHI"
  attr_reader :cells

  def initialize(side_length)
    @cells = {}
    set_grid(side_length)
  end

  def place(ship, coords)
    fail 'Not on the board' unless cells.key?(coords)
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

  def set_grid(side_length)
    (1..side_length).each do |number|
      (0...side_length).each do |letter|
        @cells["#{ALPHABET[letter]}#{number}"] = nil
      end
    end
  end

  def floating_ships
    grid = @cells.values
    grid.keep_if { |value| value.is_a? Ship }
    grid.keep_if { |ship| !ship.sunk? }
  end
end
