# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'one_player_game'
require_relative 'two_player_game'

# Classes include:
  # ConnectFourGame
    # OnePlayerGame
    # TwoPlayerGame
  # GameBoard
  # Player

# Modules include:
  # BoardDisplay
  # TextDisplay

game = ConnectFourGame.new
game.play_game
