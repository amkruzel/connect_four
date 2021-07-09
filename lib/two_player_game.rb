# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'

# this contains methods specifically for a two player game
class TwoPlayerGame < ConnectFourGame
  attr_reader :current_player

  def initialize
    ask_for_names
    @current_player = @player1
  end

  def ask_for_names
    puts 'What is the name of player 1? This person will go first.'
    @player1 = Player.new(player_name_input, $black_token, self)
    puts 'What is the name of player 2?'
    @player2 = Player.new(player_name_input, $white_token, self)
  end
end
