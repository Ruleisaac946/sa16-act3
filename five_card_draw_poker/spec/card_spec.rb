# spec/card_spec.rb
require_relative '../lib/card'

describe Card do
  describe '#initialize' do
    it 'creates a card with a suit and a value' do
      card = Card.new('Hearts', 'K')
      expect(card.suit).to eq('Hearts')
      expect(card.value).to eq('K')
    end

    it 'raises an error for an invalid suit' do
      expect { Card.new('Circles', '10') }.to raise_error(ArgumentError)
    end

    it 'raises an error for an invalid value' do
      expect { Card.new('Diamonds', 'Z') }.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the card' do
      card = Card.new('Clubs', 'Q')
      expect(card.to_s).to eq('Q of Clubs')
    end
  end
end
