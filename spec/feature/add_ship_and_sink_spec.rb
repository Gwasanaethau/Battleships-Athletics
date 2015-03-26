require 'capybara/rspec'

feature 'a ship be placed in a cell, hit the ship and it sinks' do
  let(:ship) { Ship.new }
  let(:cell) { Cell.new }
  scenario 'place ship in cell' do
    cell.place(ship)
    expect(cell.content).to equal ship
  end

  scenario 'sink the ship' do
    cell.place(ship)
    cell.takes_hit
    expect(cell.content).to be_sunk
  end
end
