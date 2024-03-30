# spec/player_spec.rb
require_relative '../lib/player'
require_relative '../lib/hand'

describe Player do
  let(:player) { Player.new('Alice') }

  describe '#initialize' do
    it 'creates a player with a name' do
      expect(player.name).to eq('Alice')
    end

    it 'starts with an empty hand' do
      expect(player.hand).to be_nil
    end

    it 'starts with a pot of 0' do
      expect(player.pot).to eq(0)
    end
  end



  describe '#get_player_action' do
    it 'returns "see" for now' do
      expect(player.get_player_action).to eq('see')
    end
  end

  describe '#add_winnings' do
    it 'increases the player pot by the specified amount' do
      player.add_winnings(50)
      expect(player.pot).to eq(50)
    end
  end
end
