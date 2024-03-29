# lib/deck.rb
require_relative 'card'

class Deck
  SUITS = %w[Hearts Diamonds Clubs Spades].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw(n = 1)
    cards_drawn = @cards.take(n)
    @cards -= cards_drawn
    cards_drawn
  end

  private

  def create_deck
    SUITS.product(VALUES).map { |suit, value| Card.new(suit, value) }
  end
end
