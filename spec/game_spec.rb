require 'game'

describe Game do
  context 'Initialisation:' do
    it 'initialises with two players and a board' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board')

      game = Game.new(player_1, player_2, board)
      expect(game).to be_a(Game)
    end

    it 'sets the current player to the first player entered' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board')

      game = Game.new(player_1, player_2, board)
      expect(game.current_player).to eq player_1
    end
  end

  context 'makes a move' do
    it 'updates the board with a players move if square is empty' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: true, update_state: nil)

      game = Game.new(player_1, player_2, board)

      result = game.make_move(1, 1)
      expect(result).to eq 'move recorded'
    end

    it 'returns message if square is taken' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil)

      game = Game.new(player_1, player_2, board)

      result = game.make_move(1, 1)
      expect(result).to eq 'square taken'
    end
  end

  context 'game management' do
    it 'switches player from player 1 to player 2' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: true, update_state: nil)

      game = Game.new(player_1, player_2, board)

      game.switch_player
      result = game.current_player
      expect(result).to eq player_2
    end

    it 'switches player back from player 2 to player 1' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil)

      game = Game.new(player_1, player_2, board)

      game.switch_player
      game.switch_player
      result = game.current_player
      expect(result).to eq player_1
    end
  end
  context 'checks status of the game' do
    it 'returns incomplete when no moves made' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])

      game = Game.new(player_1, player_2, board)

      result = game.status
      expect(result).to eq 'incomplete'
    end

    it 'returns incomplete when no player has claimed a row' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [['Y', 'X', 'X'],['X', 'X', 'Y'],['Y', 'Y', 'X']])

      game = Game.new(player_1, player_2, board)

      result = game.status
      expect(result).to eq 'incomplete'
    end
    it 'returns complete when middle horizontal line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil],['X', 'X', 'X'],[nil, nil, nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when middle horizontal line is claimed by O' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil],['O', 'O', 'O'],[nil, nil, nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when top horizontal line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [['X', 'X', 'X'],[nil, nil, nil],[nil, nil, nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when top horizontal line is claimed by O' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [['O', 'O', 'O'],[nil, nil, nil],[nil, nil, nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when bottom horizontal line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil],[nil, nil, nil],['X', 'X', 'X']])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when bottom horizontal line is claimed by O' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil],[nil, nil, nil],['O', 'O', 'O']])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when first vertical line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [['X', nil, nil],['X', nil, nil],['X', nil, nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when second vertical line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, 'X', nil],[nil, 'X', nil],[nil, 'X', nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when third vertical line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, 'X'],[nil, nil, 'X'],[nil, nil, 'X']])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when first diagonal line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [['X', nil, nil],[nil, 'X', nil],[nil, nil, 'X']])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

    it 'returns complete when second diagonal line is claimed by X' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, 'X'],[nil, 'X', nil],['X', nil, nil]])

      game = Game.new(player_1, player_2, board)
  
      result = game.status
      expect(result).to eq 'complete'
    end

  end

  context 'returns the name of the winner when game is complete' do
    it 'returns "Player 1 Name" when "X" claims a whole line' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, 'X'],[nil, 'X', nil],['X', nil, nil]])

      game = Game.new(player_1, player_2, board)
      
      game.status
      result = game.winner
      expect(result).to eq 'Player 1 Name'
    end
    it 'returns "Player 2 Name" when "O" claims a whole line' do
      player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
      player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
      board = double('board', is_empty: false, update_state: nil, state: [['O', 'O', 'O'],[nil, 'X', 'X'],['X', nil, nil]])

      game = Game.new(player_1, player_2, board)
      
      game.status
      result = game.winner
      expect(result).to eq 'Player 2 Name'
    end
  end

end
