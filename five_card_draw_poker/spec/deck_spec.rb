# spec/deck_spec.rb
require_relative '../lib/deck'
require_relative '../lib/card' # Assuming you need this

describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(deck.cards.size).to eq(52)
    end

    it 'contains unique cards' do
      expect(deck.cards.uniq.size).to eq(52)
    end
  end

  describe '#shuffle!' do
    it 'changes the order of the cards' do
      original_deck = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq(original_deck)
    end
  end

  describe '#draw' do
    it 'removes the specified number of cards from the deck' do
      original_size = deck.cards.size
      deck.draw(3)
      expect(deck.cards.size).to eq(original_size - 3)
    end

    it 'returns an array of Card objects' do
      cards_drawn = deck.draw(2)
      expect(cards_drawn.all? { |card| card.is_a?(Card) }).to eq(true)
    end
  end
end
