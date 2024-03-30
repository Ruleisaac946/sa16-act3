# spec/game_spec.rb
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/deck'

describe Game do
  let(:game) { Game.new(['Alice', 'Bob']) }

  describe '#initialize' do
    it 'creates players' do
      expect(game.players.size).to eq(2)
      expect(game.players[0]).to be_a(Player)
    end

    it 'creates a deck' do
      expect(game.deck).to be_a(Deck)
    end

    it 'starts with a pot of 0' do
      expect(game.pot).to eq(0)
    end
  end

  describe '#deal_cards' do
    it 'gives each player a hand of 5 cards' do

      game.deal_cards
      game.players.each do |player|
        expect(player.hand.cards.size).to eq(5)
      end
    end
  end
end
