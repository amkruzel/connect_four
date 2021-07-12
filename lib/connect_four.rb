# frozen_string_literal: true

require_relative 'modules/text_display'
require_relative 'modules/inputs'
require_relative 'game_board'

# #play_game initializes most classes outside this file
# -> @game = TwoPlayerGame.new or OnePlayerGame.new
# -> @board = GameBoard.new

# this is the main class that will call most of the methods
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
      @board.display_board
      ask_for_square
      take_turn
      if @board.check_for_winner(@game.current_player.token)
        game_over(@game.current_player)
        return
      end
      @game.next_player
      # ask cur_player where they want to go
      # also give option to save game
    end
  end

  def game_over(winner = nil)
    @board.display_board
    win if winner
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

  def next_player
    self.current_player = current_player == @player1 ? @player2 : @player1
  end
end
