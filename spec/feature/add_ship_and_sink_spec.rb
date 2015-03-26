require 'capybara/rspec'

feature 'a ship can be placed on a board, hit the ship and it sinks' do
  let(:ship) { Ship.new }
  let(:board) { Board.new }
  let(:coords) { 'A1' }

  scenario 'place ship on board' do
    board.place(ship, coords)
    expect(board.cells[coords]).to equal ship
  end

  scenario 'sink the ship' do
    board.place(ship, coords)
    board.takes_hit(coords)
    expect(board.cells[coords]).to be_sunk
  end

  scenario 'record a miss' do
    board.takes_hit(coords)
    expect(board.cells[coords]).to eq :miss
  end

  scenario 'the game is won' do
    board.place(ship, coords)
    board.takes_hit(coords)
    expect(board).to be_won
  end
end
