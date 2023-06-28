require 'player'

describe Player do
  context 'initialises:' do
    it 'initilises with a player name' do
      player_1 = Player.new("Player 1 Name", "X")
      expect(player_1.name).to eq "Player 1 Name"
    end
    it 'initialises with a player symbol' do
      player_1 = Player.new("Player 1 Name", "X")
      expect(player_1.symbol).to eq "X"
    end
  end
end