# frozen_string_literal: true

# methods that receive and verify player input
module Inputs
  def player_input(min, max)
    loop do
      input = gets.chomp
      error_message = "Invalid input - please enter a number in between #{min} and #{max}."
      verified_input = verify_input(min, max, input.to_i)
      return verified_input if input.match?(/^\d$/) && verified_input

      puts error_message
    end
  end

  def verify_input(min, max, input)
    input.between?(min, max) ? input : nil
  end

  def player_name_input
    loop do
      input = gets.chomp
      error_message = 'Invalid input - name must be between 1 and 40 characters in length.'
      return input if input.length.between?(1, 40)

      puts error_message
    end
  end
end
