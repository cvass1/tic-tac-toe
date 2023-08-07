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
      board = double('board', is_empty: false, update_state: nil)

      game = Game.new(player_1, player_2, board)

      result = game.status
      expect(result).to eq player_1
    end
  end
end
