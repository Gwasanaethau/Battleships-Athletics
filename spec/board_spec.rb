require 'board'

describe Board do
  let(:ship) { double(:ship) }
  let(:coords) { 'A1' }
  before(:each) { allow(ship).to receive(:hit) }
  before(:each) { allow(ship).to receive(:sunk?) { false } }
  it 'can place a ship in cells' do
    subject.place(ship, coords)
    expect(subject.cells[coords]).to equal ship
  end

  it 'must place a ship on the board' do
    wrong_coords = 'Z99'
    expect { subject.place(ship, wrong_coords) }.to raise_error 'Not on the board'
  end

  it 'can be hit when there is a ship present' do
    subject.place(ship, coords)
    subject.takes_hit(coords)
    allow(ship).to receive(:sunk?) { true }
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

  it 'cannot take a hit when already hit, cell with ship' do
    subject.place(ship, coords)
    subject.takes_hit(coords)
    allow(ship).to receive(:sunk?) { true }
    expect { subject.takes_hit(coords) }.to raise_error "Ship already hit"
  end

  it 'cannot take a hit when already hit, cell without ship' do
    subject.takes_hit(coords)
    expect { subject.takes_hit(coords) }.to raise_error "Cell already hit"
  end

  it 'knows if it is a winning board' do
    subject.place(ship, coords)
    subject.takes_hit(coords)
    expect(subject).to be_won
  end
end
