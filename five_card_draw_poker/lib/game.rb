# lib/game.rb
require_relative 'deck'
require_relative 'player'
require_relative 'hand'

class Game
  attr_reader :players, :deck, :pot

  def initialize(player_names)
    @players = player_names.map { |name| Player.new(name) }
    @deck = Deck.new
    @pot = 0
  end

  def deal_cards
    @players.each do |player|
      player.hand = Hand.new(@deck.draw(5))
    end
  end

  # Methods to implement:
  # - manage_bets (handling betting rounds)
  # - determine_winner
  # - play_round (control a single round within the game)
  # - play (control the overall game flow)
end
