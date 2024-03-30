# lib/player.rb
class Player
  attr_accessor :name, :hand, :pot

  def initialize(name)
    @name = name
    @hand = nil
    @pot = 0
  end

  def receive_hand(hand)
    @hand = hand
  end

  def discard(*card_indices)
    return unless @hand

    card_indices.flatten.sort.reverse_each { |index| @hand.cards.delete_at(index) }


    puts "Cards after discard: " + @hand.cards.map(&:to_s).join(", ")

    indices.map do |index|
      card = @hand.cards[index]
      puts "Removing card (index #{index}): #{card}"

      card if card.is_a?(Card)
    end.compact
  end





  def get_player_action
    "see"
  end

  def add_winnings(amount)
    @pot += amount
  end
end
