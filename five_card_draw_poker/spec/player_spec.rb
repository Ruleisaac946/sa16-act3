# spec/player_spec.rb
require_relative '../lib/player'
require_relative '../lib/hand'  # You might need this, depending on your Hand class

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

  describe '#discard' do
    it 'removes specified cards from the hand and returns them' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Diamonds', 'J'),
        Card.new('Clubs', 'Q')
      ])
      player.hand = hand

      discarded_cards = player.discard([0, 2])

      expect(player.hand.cards.size).to eq(1)
      expect(discarded_cards.size).to eq(2)
      expect(discarded_cards).to contain_exactly(
        Card.new('Hearts', '10'), Card.new('Clubs', 'Q')
      )
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
