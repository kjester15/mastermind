# the Board class represents the game board while the user is in guess mode
class Board
  attr_reader :round, :guess, :answer, :clue, :win

  def initialize
    @symbols = %w[1 2 3 4 5 6] # use %w for arrays of strings
    @answer = [@symbols.sample, @symbols.sample, @symbols.sample, @symbols.sample]
    @guess = []
    @clue = []
    @win = false
    @round = 1
  end

  def guess_symbol
    for x in 0..3 do
      puts "Guess: #{x + 1}"
      @guess[x] = gets.chomp
      until @symbols.include?(@guess[x])
        puts 'Please select from the following list of choices: [1, 2, 3, 4, 5, 6]'
        @guess[x] = gets.chomp
      end
    end
    @round += 1
    @guess
  end

  def create_clue
    # x if not in answer at all
    # o if in answer but not right spot
    # @ if correct answer
    for x in 0..3 do
      if @guess[x] == @answer[x]
        @clue[x] = '@'
      elsif @answer.include?(@guess[x])
        @clue[x] = 'o'
      else
        @clue[x] = 'x'
      end
    end
    @clue
  end

  def check_for_win
    # checks if clue array only contains "@"
    return unless @clue.include?('@')
    return unless @clue.uniq.count <= 1

    puts 'You win!'
    @win = true
  end
end

class Computer
  def initialize; end
end

class Solution
  def initialize
    @option = []
  end
end

while
    game_mode = ''
    puts "Welcome to 'Mastermind'! Would you like to create a secret code for the computer to guess, \
or guess the computer's secret code? Type 'A' for create or 'B' for guess"
    # ask user if they want to create secret code or guess
    until game_mode == "A" || game_mode == "B"
      game_mode = gets.chomp.upcase
      break if game_mode == "A" || game_mode == "B"

      puts "Please enter a valid option: 'A' to create a secret code, or 'B' \
to guess the secret code"
    end

    if game_mode == 'A' # create code mode
      # insert code
    elsif game_mode == 'B' # guess code mode
      # create new board
      current_board = Board.new
      # explain rules
      puts "You have 12 rounds to figure out what the 4 symbol code is. An 'x' indicates your guess \
is not in the answer at all, an 'o' indicates your guess is in the answer but wasn't in the correct spot, \
and an '@' indicates you've guessed the correct symbol in the correct spot. Your available options are: 1 2 3 4 5 & 6. \
Good luck!"
      # error check - print answer (DELETE)
      p current_board.answer
      # loop until user runs out of guesses or user guesses the correct answer
      while current_board.round < 13 && !current_board.win
        puts "Round: #{current_board.round}"
        user_guess = current_board.guess_symbol
        puts "Your guess is: #{user_guess}"
        clue = current_board.create_clue
        puts "Your clue is: #{clue}"
        current_board.check_for_win
      end
    end
    # display lose text if user didn't win
    if current_board.win == false then puts "Better luck next time! The correct answer was: #{current_board.answer}" end

    # ask to play another game
    answer = ''
    until answer == 'yes' || answer == 'no'
      puts 'Would you like to play again?'
      answer = gets.chomp.downcase
      break if answer == 'yes' || answer == 'no'

      puts "Please answer with 'yes' or 'no'"
    end
    break if answer == 'no'
end
