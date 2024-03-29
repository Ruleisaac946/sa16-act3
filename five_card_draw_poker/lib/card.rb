# lib/card.rb
class Card
  SUITS = %w[Hearts Diamonds Clubs Spades].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :suit, :value

  def initialize(suit, value)
    raise ArgumentError, "Invalid suit" unless SUITS.include?(suit)
    raise ArgumentError, "Invalid value" unless VALUES.include?(value)

    @suit = suit
    @value = value
  end

  def to_s
    "#{@value} of #{@suit}"
  end
end
