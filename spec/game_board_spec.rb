# frozen_string_literal: true

require_relative '../lib/modules/board_display'
require_relative '../lib/game_board'

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
    # checks for winner and returns true or false
    context 'when there are four horizontal of same color' do
      subject(:board_horiz_winner) { described_class.new }

      before do
        # make a horizontal winning board
        token = '⚫'
        4.times { |n| board_horiz_winner.update(n + 1, token) }
      end

      it 'returns true' do
        token = '⚫'
        t_or_f = board_horiz_winner.check_for_winner(token)
        expect(t_or_f).to eq true
      end
    end

    context 'when there are four vertical of same color' do
      subject(:board_vert_winner) { described_class.new }

      before do
        # make a vertical winning board
        token = '⚫'
        4.times { board_vert_winner.update(2, token) }
      end

      it 'returns true' do
        token = '⚫'
        t_or_f = board_vert_winner.check_for_winner(token)
        expect(t_or_f).to eq true
      end
    end

    context 'when there are four diag of same color' do
      subject(:board_diag_winner) { described_class.new }

      before do
        # make a diagonal winning board
        w_token = '⚪'
        b_token = '⚫'
        blank = 'x'
        4.times { |n| board_diag_winner.update(n + 1, n == 0 ? w_token : blank) }
        3.times { |n| board_diag_winner.update(n + 2, n == 0 ? w_token : b_token) }
        2.times { |n| board_diag_winner.update(n + 3, n == 0 ? w_token : blank) }
        board_diag_winner.update(4, w_token)

        board_diag_winner.check_for_winner
      end

      xit 'returns true' do
        t_or_f = board_diag_winner.check_for_winner
        expect(t_or_f).to eq true
      end
    end

    context 'when there are not four in a row' do
      subject(:no_win_board) { described_class.new }

      before do
        no_win_board.update(2, 'x')
      end

      xit 'returns false' do
        t_or_f = no_win_board.check_for_winner
        expect(t_or_f).to eq false
      end
    end

    context 'when there are four in a row but not of same color' do
      subject(:not_same_color_four) { described_class.new }

      before do
        # make four horiz of alternating colors
        w_token = '⚪'
        b_token = '⚫'
        4.times { |n| not_same_color_four.update(n + 1, n.even? ? w_token : b_token) }
      end

      xit 'returns false' do
        t_or_f = not_same_color_four.check_for_winner
        expect(t_or_f).to eq false
      end
    end
  end
end
