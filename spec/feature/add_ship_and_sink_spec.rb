require 'capybara/rspec'

feature 'a ship can be placed on a board, hit the ship and it sinks' do
  let(:ship) { Ship.new }
  let(:board) { Board.new(2) }
  let(:coords) { 'A1' }

  scenario 'a board can be created to a specific size' do
    side_length = 2
    board = Board.new(side_length)
    expect(board.cells.length).to eq side_length**2
  end

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

  scenario 'cannot fire at a cell with ship that has already been hit' do
    board.place(ship, coords)
    board.takes_hit(coords)
    expect { board.takes_hit(coords) }.to raise_error "Ship already hit"
  end

  scenario 'cannot fire at a missed cell that has already been hit' do
    board.takes_hit(coords)
    expect { board.takes_hit(coords) }.to raise_error "Cell already hit"
  end

  scenario 'the game is won' do
    board.place(ship, coords)
    board.takes_hit(coords)
    expect(board).to be_won
  end
end
