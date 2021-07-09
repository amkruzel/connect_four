# frozen_string_literal: true

require_relative '../lib/game_board'
require_relative '../lib/board_display'

describe GameBoard do
  include BoardDisplay

  describe '#initialize' do
    # make sure initial board state is correct
  end

  describe '#display_board' do
    # method is passed the @cur_board
    subject(:board_display) { described_class.new }

    it 'puts the @cur_board arr' do
      board = board_display.cur_board
      expect(board_display).to receive(:puts).with(board)
      board_display.display_board
    end
  end

  describe '#update' do
    # method updates the @cur_board arr with the input that is received
    subject(:board_update) { described_class.new }

    context 'when receiving bottom empty square as argument' do
      before do
        cur_token = '⚫'
        board_update.update(3, cur_token)
      end

      it '@cur_board arr is changed accordingly' do
        cur_token = '⚫'
        correct_board = Array.new(6) { Array.new(7, ' ') }
        correct_board[5][2] = cur_token

        expect(board_update.cur_board).to eq(correct_board)
      end
    end

    # this can surely be done more efficiently
    context 'when receiving last empty square' do
      before do
        cur_token = '⚫'
        board_update.cur_board[5][2] = cur_token
        board_update.cur_board[4][2] = cur_token
        board_update.cur_board[3][2] = cur_token
        board_update.cur_board[2][2] = cur_token
        board_update.cur_board[1][2] = cur_token
        board_update.update(3, cur_token)
      end

      it '@cur_board arr is changed accordingly' do
        cur_token = '⚫'
        correct_board = Array.new(6) { Array.new(7, ' ') }
        correct_board[5][2] = cur_token
        correct_board[4][2] = cur_token
        correct_board[3][2] = cur_token
        correct_board[2][2] = cur_token
        correct_board[1][2] = cur_token
        correct_board[0][2] = cur_token

        expect(board_update.cur_board).to eq(correct_board)
      end
    end
  end

  describe '#check_for_winner' do
    context 'when there are four horizontal of same color' do
      subject(:board_horiz_winner) { described_class.new }

      it 'displays winning message with cur_player name'
    end

    context 'when there are four vertical of same color' do
    end

    context 'when there are four diag of same color' do
    end

    context 'when there are not four in a row' do
    end

    context 'when there are four in a row but not of same color' do
    end
  end
end
