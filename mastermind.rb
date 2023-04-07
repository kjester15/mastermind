class Board
    attr_accessor 
    attr_reader :round, :guess, :answer, :clue, :win

    def initialize
        @symbols = ["1", "2", "3", "4", "5", "6"]
        @answer = [@symbols.sample, @symbols.sample, @symbols.sample, @symbols.sample]
        @guess = []
        @clue = []
        @win = false
        @round = 1
    end

    def get_guess
        for x in 0..3 do
            puts "Guess: #{x+1}"
            @guess[x] = gets.chomp
            until @symbols.include?(@guess[x])
                puts "Please select from the following list of choices: [1, 2, 3, 4, 5, 6]"
                @guess[x] = gets.chomp
            end
        end
        @round += 1
        return @guess
    end

    def create_clue
        # x if not in answer at all
        # o if in answer but not right spot
        # @ if correct answer
        for x in 0..3 do
            if @guess[x] == @answer[x]
                @clue[x] = "@"
            elsif @answer.include?(@guess[x])
                @clue[x] = "o"
            else
                @clue[x] = "x"
            end
        end
        return @clue
    end

    def check_for_win
        # checks if clue array only contains "@"
        if @clue.include?("@")
            if @clue.uniq.count <= 1
                puts "You win!"
                @win = true
            end
        end
    end
end

while
    # create new board
    current_board = Board.new
    p current_board.answer
    
    # loop until user runs out of guesses or user guesses the correct answer
    while current_board.round < 11 && (not current_board.win)
        puts "Round: #{current_board.round}"
        user_guess = current_board.get_guess
        puts "Your guess is: #{user_guess}"
        clue = current_board.create_clue
        puts "Your clue is: #{clue}"
        current_board.check_for_win
    end

    # ask to play another game
    answer = ""
    until answer == "yes" || answer == "no"
        puts "Would you like to play again?"
        answer = gets.chomp.downcase
        if answer == "yes" || answer == "no"
            break
        else
            puts "Please answer with 'yes' or 'no'"
        end
    end
    if answer == "no"
        break
    end
end
