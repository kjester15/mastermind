class Board
    attr_accessor :answer, :guess

    def initialize
        @symbols = ["1", "2", "3", "4", "5", "6"]
        @answer = [@symbols.sample, @symbols.sample, @symbols.sample, @symbols.sample]
        @guess = []
    end

    def get_guess
        for x in 0..3 do
            puts "x = #{x}"
            @guess[x] = gets.chomp
            until @symbols.include?(@guess[x])
                puts "Please select from the following list of choices: [1, 2, 3, 4, 5, 6]"
                @guess[x] = gets.chomp
            end
        end
        return @guess
    end
end

current_board = Board.new
p current_board.answer
user_guess = current_board.get_guess
p user_guess
