class Board
    attr_accessor :answer

    def initialize
        @symbols = ["a", "s", "d", "f", "g", "h"]
        @answer = [@symbols.sample, @symbols.sample, @symbols.sample, @symbols.sample]
        @guess = []
    end
end

current_board = Board.new
p current_board.answer
