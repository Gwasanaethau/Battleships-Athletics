require 'board'

describe Board do
  let(:ship) { double(:ship) }
  let(:coords) { 'A1' }
  before(:each) { allow(ship).to receive(:hit) }
  before(:each) { allow(ship).to receive(:sunk?) { true } }
  it 'can place a ship in cells' do
    subject.place(ship, coords)
    expect(subject.cells[coords]).to equal ship
  end

  it 'can be hit when there is a ship present' do
    subject.place(ship, coords)
    subject.takes_hit(coords)
    expect(subject.cells[coords]).to be_sunk
  end

  it 'it can miss when there is not a ship present' do
    subject.takes_hit(coords)
    expect(subject.cells[coords]).to eq :miss
  end

  it 'has cells' do
    expect(subject.cells).to be_a Hash
  end

  it 'has a location on loading' do
    expect(subject.cells).not_to be_empty
  end

  it 'knows if it is a winning board' do
    subject.place(ship, coords)
    subject.takes_hit(coords)
    expect(subject).to be_won
  end
end
