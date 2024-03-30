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

  describe "#discard" do
    context "when the player has a hand" do
      let(:dealt_cards) { [Card.new('Hearts', 'Ace'), Card.new('Diamonds', '10'), Card.new('Clubs', '8')] }

      before do
        hand = Hand.new(dealt_cards)
        allow(hand).to receive(:cards).and_return(dealt_cards)
        player.receive_hand(hand)
      end

      it "removes specified cards from the player's hand" do
        player.discard(0, 2)
        expect(player.hand.cards.size).to eq(1)
      end
    end

    context "when the player has no hand" do
      it "does nothing" do
        expect { player.discard(0, 1, 2) }.not_to raise_error
      end
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
