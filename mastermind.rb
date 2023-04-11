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
    4.times do |i|
      puts "Guess: #{i + 1}"
      @guess[i] = gets.chomp
      until @symbols.include?(@guess[i])
        puts 'Please select from the following list of choices: [1, 2, 3, 4, 5, 6]'
        @guess[i] = gets.chomp
      end
    end
    @round += 1
    @guess
  end

  def create_clue
    # x if not in answer at all
    # o if in answer but not right spot
    # @ if correct answer
    4.times do |i|
      if @guess[i] == @answer[i]
        @clue[i] = '@'
      elsif @answer.include?(@guess[i])
        @clue[i] = 'o'
      else
        @clue[i] = 'x'
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

# the Computer class represents the ai computer that guesses the users code in create mode
class Computer
  attr_reader :solutions
  def initialize
    @solutions = []
  end

  def populate_solutions
    # creates all solutions from 1111 to 6666
    (1..6).each do |a|
      (1..6).each do |b|
        (1..6).each do |c|
          (1..6).each do |d|
            letter_a = a.to_s
            letter_b = b.to_s
            letter_c = c.to_s
            letter_d = d.to_s
            @solutions << letter_a + letter_b + letter_c + letter_d
          end
        end
      end
    end
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
      current_computer = Computer.new
      current_computer.populate_solutions
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
      # display lose text if user didn't win
      if current_board.win == false then puts "You lost! The correct answer was: #{current_board.answer}" end
    end

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
