# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'player'

# this contains methods specifically for a two player game
class TwoPlayerGame < ConnectFourGame
  attr_accessor :current_player

  def initialize
    ask_for_names
    @current_player = @player1
  end

  def ask_for_names
    puts "\nWhat is the name of player 1? This person will go first.\n"
    @player1 = Player.new(player_name_input, $p1_token, self)
    puts "\nWhat is the name of player 2?\n"
    @player2 = Player.new(player_name_input, $p2_token, self)
  end
end
