require 'board'

describe Board do
  context 'initialisation:' do
    it 'it initialises with a 3x3 array of arrays with all squares at nil' do
      board = Board.new()
      result = board.get_state()
      expect(result[0]).to eq [nil, nil, nil]
      expect(result[1]).to eq [nil, nil, nil]
      expect(result[2]).to eq [nil, nil, nil]
    end
  end
  context 'updates state of the board:' do
    it 'translates cordinates and adds a single symbol to the board' do
      board = Board.new()
      board.update_state(1, 1, "X")
      result = board.get_state()
      expect(result[0]).to eq [nil, nil, nil]
      expect(result[1]).to eq [nil, nil, nil]
      expect(result[2]).to eq ["X", nil, nil]
    end

    it 'translates cordinates and adds two symbols to the board' do
      board = Board.new()
      board.update_state(1, 1, "X")
      board.update_state(3, 3, "O")
      result = board.get_state()
      expect(result[0]).to eq [nil, nil, "O"]
      expect(result[1]).to eq [nil, nil, nil]
      expect(result[2]).to eq ["X", nil, nil]
    end
    it 'translates cordinates and adds all symbols to the board' do
      board = Board.new()
      board.update_state(1, 1, "X")
      board.update_state(2, 1, "X")
      board.update_state(3, 1, "X")
      board.update_state(1, 2, "O")
      board.update_state(2, 2, "O")
      board.update_state(3, 2, "O")
      board.update_state(1, 3, "X")
      board.update_state(2, 3, "O")
      board.update_state(3, 3, "X")
      result = board.get_state()
      expect(result[0]).to eq ["X", "O", "X"]
      expect(result[1]).to eq ["O", "O", "O"]
      expect(result[2]).to eq ["X", "X", "X"]
    end
  end

  context 'returns the state of an individual square' do
    it 'returns true if square is empty' do
      board = Board.new()
      result = board.is_empty(1, 1)
      expect(result).to eq true
    end
    it 'returns false if square is taken' do
      board = Board.new()
      board.update_state(1, 1, "X")
      result = board.is_empty(1, 1)
      expect(result).to eq false
    end
  end
end