# frozen_string_literal: true

require_relative 'text_display'
require_relative 'main'
# require_relative 'one_player_game'
# require_relative 'two_player_game'

# this is the main class that will call most of the methods
class ConnectFourGame
  include TextDisplay

  def initialize
  end

  def play_game
    introduction
    if player_input == 1
      puts 'Do you want to play against the computer or against a friend?'
      new_game
    else
      load_game
    end
  end

  def introduction
    game_title_screen
  end

  def player_input(min, max)
    loop do
      input = gets.chomp
      error_message = "Invalid input - please enter a number in between #{min} and #{max}."
      verified_input = verify_input(min, max, input.to_i)
      return verified_input if input.match?(/^\d$/) && verified_input

      puts error_message
    end
  end

  def verify_input(min, max, input)
    input.between?(min, max) ? input : nil
  end

  def player_name_input
    loop do
      input = gets.chomp
      error_message = 'Invalid input - name must be between 1 and 40 characters in length.'
      return input if input.length.between?(1, 40)

      puts error_message
    end
  end

  def new_game
    player_input(1, 2) == 1 ? TwoPlayerGame.new : OnePlayerGame.new
  end
end
