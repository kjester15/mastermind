# mastermind
Mastermind game played in the terminal, created with Ruby

<!-- TODO -->
Create classes
1. decoding board
    - a correct answer made up of 4 randomly selected symbols (array of 4)
    - blank array that holds guess
    - 6 total symbols to use to guess the answer
    - 12 tries to guess
    - feedback method which lets player know how close their guess is
2. computer
    - creates all possible solutions
    - makes guesses
    - analyzes solutions based on clues
3. solution
    - holds all possible solutions remaining


Algo tip:
- Search for Knuth algorithm or Swaszek algorithm (Swaszek possibly easier)

Per wiki
1. Create the set S of 1296 possible codes, 1111,1112,.., 6666.
2. Start with initial guess 1122 (Knuth gives examples showing that some other first guesses such as 1123, 1234 do not win in five tries on every code).
3. Play the guess to get a response of colored and white pegs.
4. If the response is four colored pegs the game is won, the algorithm terminates.
5. Otherwise, remove from S any code that would not give the same response if it (the guess) were the code.
6. Apply minimax technique to find a next guess as follows: For each possible guess, that is, any unused code of the 1296 not just those in S, calculate how many possibilities in S would be     eliminated for each possible colored/white peg score. The score of a guess is the minimum number of possibilities it might eliminate from S. From the set of guesses with the maximum score select one as the next guess, choosing a member of S whenever possible. (Knuth follows the convention of choosing the guess with the least numeric value e.g. 2345 is lower than 3456. Knuth also gives an example showing that in some cases no member of S will be among the highest scoring guesses and thus the guess cannot win on the next turn yet will be necessary to assure a win in five.)
7. Repeat from step 3.

https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind