# frozen_string_literal: true

require_relative '../lib/two_player_game'

describe TwoPlayerGame do
  describe '#initialize' do
    # make sure player instance variables are correct
  end

  describe '#player_name_input' do
    # this method is used to verify that the name is 40 characters (this is arbitrary) or less in length
    subject(:name_input) { described_class.new }

    context 'when receiving valid input' do
      before do
        valid_input = 'alexander'
        allow(name_input).to receive(:gets).and_return(valid_input)
      end

      it 'does not complete loop - returns valid input' do
        error_message = 'Invalid input - name must be between 1 and 40 characters in length.'
        expect(name_input).not_to receive(:puts).with(error_message)
        name_input.player_name_input
      end
    end

    context 'when receiving invalid input once, then valid input' do
      before do
        invalid_input = 'christopher____dhfasbdbfhdasfbhjadksbfcjlwaneiocnwdjaklsfvcawedcasFFDSAFAS'
        valid_input = 'bo'
        allow(name_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'loops once and gives error message, then returns valid input' do
        error_message = 'Invalid input - name must be between 1 and 40 characters in length.'
        expect(name_input).to receive(:puts).with(error_message).exactly(1).time
        name_input.player_name_input
      end
    end

    context 'when input is exactly 40 characters' do
      before do
        valid_input = 'ksbfcjlwaneiocnwdjaklsfvcawedcasFFDSAFAS'
        allow(name_input).to receive(:gets).and_return(valid_input)
      end

      it 'does not complete loop - returns valid input' do
        error_message = 'Invalid input - name must be between 1 and 40 characters in length.'
        expect(name_input).not_to receive(:puts).with(error_message)
        name_input.player_name_input
      end
    end

    context 'when input is 0 characters, then 5 characters' do
      before do
        invalid_input = ''
        valid_input = '3alex'
        allow(name_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'loops once and gives error message once, then returns valid input' do
        error_message = 'Invalid input - name must be between 1 and 40 characters in length.'
        expect(name_input).to receive(:puts).with(error_message).exactly(1).times
        name_input.player_name_input
      end
    end
  end

  describe '#verify_name' do
    # check to make sure name is only alphabetic characters
    # returns input if valid, else returns nil
  end
end