# frozen_string_literal: true

require_relative 'board_display'

# this class contains current board state and methods to manipulate board state
class GameBoard
  include BoardDisplay

  attr_reader :cur_board

  def initialize(cur_board = Array.new(6) { Array.new(7, ' ') })
    @cur_board = cur_board
  end

  def update(sqr, token)
    sqr -= 1 # array is 0-indexed

    @cur_board.reverse_each do |row|
      if row[sqr] == ' '
        row[sqr] = token
        break
      end
    end
  end

  def valid_sqr(sqr)
    return false if @cur_board[0][sqr] != ' '

    true
  end

  def check_for_winner
  end
end
