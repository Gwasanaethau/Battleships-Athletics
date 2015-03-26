class Ship
  def initialize
    @sunk = false
  end

  def hit
    @sunk = true
  end

  def sunk?
    @sunk
  end
end
