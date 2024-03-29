# spec/player_spec.rb
require_relative '../lib/player'
require_relative '../lib/hand'

RSpec.describe Player do
  let(:hand) { instance_double(Hand) }
  let(:player) { Player.new('Alice', hand) }

  describe '#initialize' do
    it 'creates a player with a name and a hand' do
      expect(player.name).to eq('Alice')
      expect(player.hand).to eq(hand)
    end

    it 'initializes the pot to zero' do
      expect(player.pot).to eq(0)
    end
  end

  describe '#discard_cards' do
    it 'calls discard_cards method on the hand with the specified indices' do
      indices = [0, 1, 2]
      expect(hand).to receive(:discard_cards).with(indices)
      player.discard_cards(indices)
    end
  end

  describe '#make_bet' do
    it 'updates the player pot based on the action and amount' do
      player.make_bet('fold', 0)
      expect(player.pot).to eq(0)

      player.make_bet('see', 10)
      expect(player.pot).to eq(10)

      player.make_bet('raise', 20)
      expect(player.pot).to eq(30)
    end
  end

  # Add more tests for other methods of the Player class as needed
end
