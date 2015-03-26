require 'board'

describe Board do
  it 'can place a ship in cells' do
    ship = double(:ship)
    coords = 'A1'
    subject.place(ship, coords)
    expect(subject.cells[coords]).to equal ship
  end

  it 'can be #hit' do
    ship = double(:ship)
    allow(ship).to receive(:hit)
    allow(ship).to receive(:sunk?) { true }
    coords = 'A1'
    subject.place(ship, coords)
    subject.takes_hit(coords)
    expect(subject.cells[coords]).to be_sunk
  end

  it 'has cells' do
    expect(subject.cells).to be_a Hash
  end
end
