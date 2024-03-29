# lib/player.rb
class Player
  attr_accessor :name, :hand, :pot

  def initialize(name)
    @name = name
    @hand = nil
    @pot = 0
  end

  def discard(indices)
    # Assumes 'indices' is an array of card positions to discard (e.g., [0, 3])
    cards_to_discard = indices.map { |index| @hand.cards[index] }
    @hand.cards -= cards_to_discard
    cards_to_discard
  end

  def get_player_action
    # Placeholder for now. This would use input/output
    # to get the player's choice: fold, see, or raise
    "see"
  end

  def add_winnings(amount)
    @pot += amount
  end
end
