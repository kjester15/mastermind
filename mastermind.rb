class Board
    attr_accessor 
    attr_reader :round, :guess, :answer, :clue

    def initialize
        @symbols = ["1", "2", "3", "4", "5", "6"]
        @answer = [@symbols.sample, @symbols.sample, @symbols.sample, @symbols.sample]
        @guess = []
        @clue = []
        @round = 1
    end

    def get_guess
        for x in 0..3 do
            puts "Guess #{x+1}"
            @guess[x] = gets.chomp
            until @symbols.include?(@guess[x])
                puts "Please select from the following list of choices: [1, 2, 3, 4, 5, 6]"
                @guess[x] = gets.chomp
            end
        end
        @round += 1
        return @guess
    end

    def check_answer
        # x if not in right spot or in answer at all
        # o if in answer but not right spot
        # @ if in answer AND right spot
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
end

current_board = Board.new
p current_board.answer
user_guess = current_board.get_guess
puts "Your guess is: #{user_guess}"
clue = current_board.check_answer
puts "Your clue is: #{clue}"

