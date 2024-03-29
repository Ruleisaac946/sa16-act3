# spec/hand_spec.rb
require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand do
  let(:cards) do
    [
      Card.new('Hearts', 'Ace'),
      Card.new('Hearts', 'King'),
      Card.new('Hearts', 'Queen'),
      Card.new('Hearts', 'Jack'),
      Card.new('Hearts', '10')
    ]
  end

  describe '#initialize' do
    it 'creates a hand with five cards' do
      hand = Hand.new(cards)
      expect(hand.cards.size).to eq(5)
    end
  end

  describe '#evaluate' do
    it 'returns the correct hand ranking' do
      hand = Hand.new(cards)
      expect(hand.evaluate).to eq('Royal Flush') # Assuming all cards are of the same suit
    end
  end

  # Add more tests for other methods of the Hand class as needed
end
