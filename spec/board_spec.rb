require 'board'

describe Board do
  it 'can place a ship in cells' do
    shipx = double(:ship)
    coords = 'A1'
    subject.place(shipx, coords)
    expect(subject.cells[coords]).to equal shipx
  end

  it 'can be hit when there is a ship present' do
    shipx = double(:shipx)
    allow(shipx).to receive(:hit)
    allow(shipx).to receive(:sunk?) { true }
    coords = 'A1'
    subject.place(shipx, coords)
    subject.takes_hit(coords)
    expect(subject.cells[coords]).to be_sunk
  end

  it 'it can miss when there is not a ship present' do
    coords = 'A1'
    subject.takes_hit(coords)
    expect(subject.cells[coords]).to eq :miss
  end

  it 'has cells' do
    expect(subject.cells).to be_a Hash
  end

  it 'has a location on loading' do
    expect(subject.cells).not_to be_empty
  end
end
