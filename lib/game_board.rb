# frozen_string_literal: true

require_relative 'modules/board_display'
require_relative 'modules/inputs'

# this class contains current board state and methods to manipulate board state
class GameBoard
  include BoardDisplay
  include Inputs

  attr_reader :cur_board

  def initialize(cur_board = Array.new(6) { Array.new(7, ' ') })
    @cur_board = cur_board
  end

  def update(sqr, token)
    sqr -= 1 # array is 0-indexed

    cur_board.reverse_each do |row|
      if row[sqr] == ' '
        row[sqr] = token
        break
      end
    end
  end

  def valid_sqr(sqr)
    return false if cur_board[0][sqr] != ' '

    true
  end

  def check_for_winner(token)
    # horizontal & vertical winner winner
    cur_board.each_with_index do |row, row_index|
      # horizontal
      4.times { |n| return true if row[n - 1, 4].all?(token) }
      # vertical/diagonal
      row.each_with_index do |sqr, col_index|
        return true if sqr == token && (vert_row(row_index, col_index, token) || diag_row(row_index, col_index, token))
      end
    end
    false
  end

  # helper function for #check_for_winner
  # if a square has token, checks 3 lower squares
  def vert_row(row_index, col_index, token)
    3.times do |n|
      false if cur_board[row_index + n + 1].nil? || cur_board.nil? || cur_board[row_index + n + 1][col_index] != token
    end
    true
  end

  # helper function for #check_for_winner
  # if a square has token, checks 3 lower rows diagonally in both directions
  def diag_row(row_index, col_index, token)
    3.times { |n| false if cur_board[row_index + n + 1][col_index - n - 1] != token }
    3.times { |n| false if cur_board[row_index + n + 1][col_index + n + 1] != token }
  end
  true
end
