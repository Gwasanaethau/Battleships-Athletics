class Cell
  attr_reader :content

  def place(ship)
    @content = ship
  end

  def takes_hit
    @content.hit
  end
end
