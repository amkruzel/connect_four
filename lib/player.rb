# frozen_string_literal: true

# a class to keep track of player name, token, and game (the class instance of their game)
# player 1 is black, player 2 is white
class Player
  attr_reader :name, :token

  $p1_token = "\e[31;1m◉\e[0m"
  $p2_token = "\e[34;1m◉\e[0m"

  def initialize(name, token, game)
    @name = name
    @token = token
    @game = game
  end
end
