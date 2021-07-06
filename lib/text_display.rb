# frozen_string_literal: true

# this module contains blocks of text that will be displayed in the terminal
module TextDisplay
  def game_title_screen
    msgs = [title, intro_msg, new_or_load_game]
    msgs.each do |msg|
      puts msg
      sleep 1.2
    end
  end

  def title
    <<~TITLE
      \e[94m
      \t█▀▀ █▀█ █▄░█ █▄░█ █▀▀ █▀▀ ▀█▀   █▀▀ █▀█ █░█ █▀█
      \t█▄▄ █▄█ █░▀█ █░▀█ ██▄ █▄▄ ░█░   █▀░ █▄█ █▄█ █▀▄
      \e[0m
    TITLE
  end

  def intro_msg
    <<~RULES
      Time to play \e[95;1mConnect Four\e[0m!

      The rules of the game are simple:
      - players will take turns placing a token into a column
      - the first player to get four in a row wins!

    RULES
  end

  def new_or_load_game
    <<~NEW_OR_LOAD
      Do you want to start a new game or load a saved game?
      [\e[91;1m1\e[0m] - New Game
      [\e[91;1m2\e[0m] - Load Game

    NEW_OR_LOAD
  end

  def one_or_two_players
    <<~NUM_PLAYERS
      Do you want to play with a friend or play against the computer?
      [\e[91;1m1\e[0m] - Play with a friend
      [\e[91;1m2\e[0m] - Play against the computer
    NUM_PLAYERS
  end
end
