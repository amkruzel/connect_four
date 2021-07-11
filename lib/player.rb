# frozen_string_literal: true

# a class to keep track of player name, token, and game (the class instance of their game)
# player 1 is black, player 2 is white
class Player
  attr_reader :name, :token

  $black_token = '⚫'
  $white_token = '⚪'

  def initialize(name, token, game)
    @name = name
    @token = token
    @game = game
  end
end
