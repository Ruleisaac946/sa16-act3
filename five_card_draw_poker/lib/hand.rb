# lib/hand.rb
require_relative 'card'

class Hand
  HAND_RANKS = {
    straight_flush: 8,
    four_of_a_kind: 7,
    full_house: 6,
    flush: 5,
    straight: 4,
    three_of_a_kind: 3,
    two_pair: 2,
    pair: 1,
    high_card: 0
  }

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank
    if straight_flush?
      :straight_flush
    elsif four_of_a_kind?
      :four_of_a_kind
    # ... Add more hand checks ...
    else
      :high_card
    end
  end

  # Add helper methods here (straight_flush?, four_of_a_kind?, etc.) ...

  def straight_flush?
    # Check for flush first (avoids unnecessary computations)
    return false unless flush?

    # Get sorted card values
    sorted_values = cards.map(&:value).sort

    # Check for straight (consecutive values with no gaps)
    # Diamonds: ['2', '3', '4', '5', '6']
    is_straight = sorted_values.each_cons(2).all? { |a, b| b.to_i == a.to_i + 1 }

    # Handle cases like A, 5, 4, 3, 2 (considered a straight in poker)
    is_straight ||= (sorted_values == %w[A 5 4 3 2])

    is_straight
  end

  def flush?
    suits = cards.map(&:suit)
    suits.uniq.size == 1 # All cards have the same suit
  end

  def four_of_a_kind?
    values = cards.map(&:value)
    values.any? { |value| values.count(value) == 4 }
  end

  # The added setter method
  def cards=(new_cards)
    @cards = new_cards
  end

  def remove(card)
    @cards.delete(card)
  end

end
