require_relative './lib/player'
require_relative './lib/hand'
require_relative './lib/card'
require_relative './lib/deck'
require_relative './lib/game'

# Game Setup
def start_game
  deck = Deck.new
  deck.shuffle!

  player = Player.new("Alice")
  computer = Player.new("Computer")

  player_hand = Hand.new(deck.draw(5))
  computer_hand = Hand.new(deck.draw(5))

  player.hand = player_hand
  computer.hand = computer_hand

  return player, computer, deck
end

# Display Hands
def show_hands(player, computer)
  puts "\nYour hand: #{player.hand.cards}"
  puts "Computer's hand: #{computer.hand.cards}"
end

# Example Discard Logic (You'll replace this)
def player_discard(player, deck)
  puts "Choose cards to discard (e.g., 0 2 4): "
  discard_choices = gets.chomp.split(" ").map(&:to_i)
  player.discard(discard_choices)
  deck.draw(discard_choices.length).each do |card|
    player.hand.cards << card
  end
end

# Main Game Loop
def play_round(player, computer, deck)
  show_hands(player, computer)
  player_discard(player, deck)
  puts "\n--- After Discard ---"
  show_hands(player, computer)
end

# Start the game
player, computer, deck = start_game()
play_round(player, computer, deck)
