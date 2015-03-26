require 'ship'

describe Ship do
  it 'is not sunk when created' do
    expect(subject).not_to be_sunk
  end

  it 'can be hit' do
    expect(subject).to respond_to :hit
  end

  it 'can be sunk' do
    subject.hit
    expect(subject).to be_sunk
  end
end
