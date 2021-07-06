# frozen_string_literal: true

require_relative 'connect_four'

# this contains methods specifically for a two player game
class TwoPlayerGame < ConnectFourGame
  def initialize
    ask_for_names
  end

  def ask_for_names
    puts 'What is the name of player 1? This person will go first.'
    @player1 = player_name_input
    puts 'What is the name of player 2?'
    @player2 = player_name_input
  end
end
