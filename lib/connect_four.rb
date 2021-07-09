# frozen_string_literal: true

require_relative 'text_display'
require_relative 'game_board'

# this is the main class that will call most of the methods
# #play_game initializes most classes outside this file
  # -> @game = TwoPlayerGame.new or OnePlayerGame.new
  # -> @board = GameBoard.new
class ConnectFourGame
  include TextDisplay

  def introduction
    game_title_screen
  end

  def play_game
    introduction
    if player_input(1, 2) == 1
      num_players_query
      new_game
    else
      load_game
    end
    game_loop
  end

  def game_loop
    loop do
      @board.display_board(@cur_board)
      take_turn(@game.current_player)
      # ask cur_player where they want to go
      # also give option to save game
    end
  end

  def take_turn(current_player)
    loop do
      ask_for_square
      error_message = 'That is an invalid column! Pick a different column.'
      sqr = player_input(1, 7)
      @board.update(sqr, current_player.token) if @board.valid_sqr(sqr - 1)

      puts error_message
    end
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
    @game = player_input(1, 2) == 1 ? TwoPlayerGame.new : OnePlayerGame.new
    @board = GameBoard.new
  end
end
