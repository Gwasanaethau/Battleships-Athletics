require 'capybara/rspec'

feature 'a ship can be placed on a board, hit the ship and it sinks' do
  let(:ship) { Ship.new }
  let(:board) { Board.new }

  scenario 'record a miss' do
    coords = 'A1'
    board.takes_hit(coords)
    expect(board.cells[coords]).to eq 'miss'
  end

  scenario 'place ship on board' do
    coords = 'A1'
    board.place(ship, coords)
    expect(board.cells[coords]).to equal ship
  end

  scenario 'sink the ship' do
    coords = 'A1'
    board.place(ship, coords)
    board.takes_hit(coords)
    expect(board.cells[coords]).to be_sunk
  end
end
