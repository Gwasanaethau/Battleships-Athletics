require 'cell'

describe Cell do
  it 'has a ship' do
    ship = double(:ship)
    subject.place(ship)
    expect(subject.content).to equal ship
  end
  it 'can be #hit' do
    expect(subject).to respond_to :takes_hit
  end
end
