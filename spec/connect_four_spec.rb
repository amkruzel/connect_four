# frozen_string_literal: true

require_relative '../lib/main'
require_relative '../lib/connect_four'
require_relative '../lib/one_player_game'
require_relative '../lib/two_player_game'

describe ConnectFourGame do
  describe '#initialize' do
    # Initialize -> no need to test
  end

  describe '#play_game' do
    # Public Script -> no need to test
  end

  describe '#introduction' do
    # only contains puts -> no need to test
  end

  describe '#player_input' do
    # this method will be used for multiple purposes so it must be able to receive different amounts of inputs
    # 1. play against computer or with another player?
    # 2. who will be player 1?
    # 3. which game to load?
    # 4. which column to put piece?

    subject(:game_input) { described_class.new }

    context 'when receiving valid input in between min/max values' do
      before do
        valid_input = '1'
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'does not complete loop - returns valid input' do
        min = 1
        max = 2
        error_message = "Invalid input - please enter a number in between #{min} and #{max}."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input(min, max)
      end
    end

    context 'when receiving invalid input once, then valid input' do
      before do
        invalid_input = '0'
        valid_input = '1'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'loops once and gives error message, then returns valid input' do
        min = 1
        max = 2
        error_message = "Invalid input - please enter a number in between #{min} and #{max}."
        expect(game_input).to receive(:puts).with(error_message).exactly(1).time
        game_input.player_input(min, max)
      end
    end

    context 'when receiving invalid input twice, then valid input' do
      before do
        invalid_input1 = '8'
        invalid_input2 = ''
        valid_input = '3'
        allow(game_input).to receive(:gets).and_return(invalid_input1, invalid_input2, valid_input)
      end

      it 'loops twice and gives error message twice, then returns valid input' do
        min = 1
        max = 7
        error_message = "Invalid input - please enter a number in between #{min} and #{max}."
        expect(game_input).to receive(:puts).with(error_message).exactly(2).times
        game_input.player_input(min, max)
      end
    end
  end

  describe '#verify_input' do
    # this method will return the input if it is an integer between min and max values, and return nil if it is not

    subject(:game_verify_input) { described_class.new }

    context 'when receiving valid input as argument' do
      it 'returns valid input' do
        min = 1
        max = 2
        valid_input = 1
        verified_input = game_verify_input.verify_input(min, max, valid_input)
        expect(verified_input).to eq(valid_input)
      end
    end

    context 'when receiving invalid input as argument' do
      it 'returns nil' do
        min = 1
        max = 2
        invalid_input = 0
        verified_input = game_verify_input.verify_input(min, max, invalid_input)
        expect(verified_input).to eq nil
      end
    end
  end

  describe '#new_game' do
    # this method will find out if one or two player game and call respective methods from class
    subject(:new_game) { described_class.new }

    context 'when it will be a two player game' do
      before do
        allow(new_game).to receive(:gets).and_return('1')
      end

      it 'creates a new instance of TwoPlayerGame' do
        expect(TwoPlayerGame).to receive(:new)
        new_game.new_game
      end
    end

    context 'when it will be a one player game' do
      before do
        allow(new_game).to receive(:gets).and_return('2')
      end

      it 'creates a new instance of TwoPlayerGame' do
        expect(OnePlayerGame).to receive(:new)
        new_game.new_game
      end
    end
  end

  describe '#load_game' do
    # TODO
  end
end
