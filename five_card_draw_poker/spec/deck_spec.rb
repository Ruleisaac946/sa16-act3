# spec/deck_spec.rb
require_relative '../lib/deck'

RSpec.describe Deck do
  describe '#initialize' do
    it 'creates a deck with 52 cards' do
      deck = Deck.new
      expect(deck.cards.size).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'shuffles the cards in the deck' do
      deck = Deck.new
      original_order = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to eq(original_order)
    end
  end

  describe '#deal' do
    it 'deals a specified number of cards from the deck' do
      deck = Deck.new
      cards = deck.deal(5)
      expect(cards.size).to eq(5)
    end

    it 'removes dealt cards from the deck' do
      deck = Deck.new
      deck.deal(5)
      expect(deck.cards.size).to eq(47) # 52 - 5 = 47
    end

    it 'raises an error if trying to deal more cards than available in the deck' do
      deck = Deck.new
      expect { deck.deal(53) }.to raise_error(RuntimeError, "Not enough cards in the deck")
    end
  end
end
