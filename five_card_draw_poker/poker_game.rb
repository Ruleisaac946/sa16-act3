require_relative './lib/player'
require_relative './lib/hand'
require_relative './lib/card'
require_relative './lib/deck'

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

# Player Discard
def player_discard(player, deck)
  puts "Choose cards to discard (e.g., 0 2 4): "
  discard_choices = gets.chomp.split(" ").map(&:to_i)
  player.discard(discard_choices)
  deck.draw(discard_choices.length).each do |card|
    player.hand.cards << card
  end
end

# Basic Computer Discard (Replace with smarter AI later)
def computer_discard(computer, deck)
  # Very simple logic for now
  discard_count = (0..2).to_a.sample # Randomly discard 0-2 cards
  computer.discard(discard_count.times.to_a)
  deck.draw(discard_count).each do |card|
    computer.hand.cards << card
  end
end

# Determine Winner (Very simplified, no hand ranking yet)
def determine_winner(player, computer)
  puts "\n--- Showdown! ---"
  puts "Your hand: #{player.hand.cards}"
  puts "Computer's hand: #{computer.hand.cards}"

  # Placeholder logic - this needs proper hand evaluation
  if player.hand.cards.size < computer.hand.cards.size
    puts "Computer wins!"
  else
    puts "You win!"
  end
end

# Main Game Loop
def play_game
  player, computer, deck = start_game()

  loop do
    show_hands(player, computer)
    player_discard(player, deck)
    computer_discard(computer, deck)

    determine_winner(player, computer)

    puts "\nPlay again? (y/n): "
    break unless gets.chomp.downcase == 'y'
  end
end

# Start the game
play_game()
