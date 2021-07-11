# frozen_string_literal: true

require_relative 'modules/text_display'
require_relative 'modules/inputs'
require_relative 'game_board'

# this is the main class that will call most of the methods
# #play_game initializes most classes outside this file
  # -> @game = TwoPlayerGame.new or OnePlayerGame.new
  # -> @board = GameBoard.new
class ConnectFourGame
  include TextDisplay
  include Inputs

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
      ask_for_square
      take_turn
      @board.check_for_winner(@game.current_player.token)
      # ask cur_player where they want to go
      # also give option to save game
    end
  end

  def take_turn
    loop do
      error_message = 'That is an invalid column! Pick a different column.'
      sqr = player_input(1, 7)
      if @board.valid_sqr(sqr - 1)
        @board.update(sqr, @game.current_player.token)
        return
      end

      puts error_message
    end
  end

  def new_game
    @game = player_input(1, 2) == 1 ? TwoPlayerGame.new : OnePlayerGame.new
    @board = GameBoard.new
  end
end
