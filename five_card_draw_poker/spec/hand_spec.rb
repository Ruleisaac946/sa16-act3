# spec/hand_spec.rb
require_relative '../lib/hand'
require_relative '../lib/card'

describe Hand do
  describe '#rank' do
    it 'returns :high_card for a basic hand' do
      hand = Hand.new([
        Card.new('Hearts', '10'),
        Card.new('Diamonds', 'J'),
        Card.new('Clubs', '4'),
        Card.new('Diamonds', '7'),
        Card.new('Spades', '2')
      ])

      expect(hand.rank).to eq(:high_card)
    end

    # Add more tests for different hand ranks:
    # it 'returns :pair for a hand with a pair' do ...
    # it 'returns :straight for a straight' do ...
    # ... and so on
  end
end
