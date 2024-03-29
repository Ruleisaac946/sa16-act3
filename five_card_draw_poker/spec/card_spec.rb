# spec/card_spec.rb
require_relative '../lib/card'

RSpec.describe Card do
  describe '#initialize' do
    it 'creates a card with a suit and value' do
      card = Card.new('Hearts', 'Ace')
      expect(card.suit).to eq('Hearts')
      expect(card.value).to eq('Ace')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the card' do
      card = Card.new('Spades', 'Jack')
      expect(card.to_s).to eq('Jack of Spades')
    end
  end
end
