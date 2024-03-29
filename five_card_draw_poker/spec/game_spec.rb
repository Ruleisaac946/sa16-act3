# spec/game_spec.rb
require_relative '../lib/game'
require_relative '../lib/player'

RSpec.describe Game do
  let(:player1) { Player.new('Player 1') }
  let(:player2) { Player.new('Player 2') }
  let(:game) { Game.new([player1, player2]) }

  describe '#initialize' do
    it 'creates a game with specified players' do
      expect(game.players).to contain_exactly(player1, player2)
    end

    it 'creates a deck for the game' do
      expect(game.deck).to be_an_instance_of(Deck)
    end

    it 'initializes the current player index' do
      expect(game.current_player_index).to eq(0)
    end

    it 'initializes the pot to zero' do
      expect(game.pot).to eq(0)
    end
  end

  describe '#start_round' do
    it 'deals five cards to each player' do
      game.start_round
      expect(player1.hand.cards.size).to eq(5)
      expect(player2.hand.cards.size).to eq(5)
    end

    it 'resets the pot to zero' do
      game.pot = 100
      game.start_round
      expect(game.pot).to eq(0)
    end
  end

  # Add more tests for other methods of the Game class as needed
end
