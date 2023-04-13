# mastermind
Mastermind game played in the terminal, created with Ruby.
In mastermind, the goal is to guess a randomly generated 4 digit code comprised (in this case) of numbers, from 1-6, inclusively. For example: 1324, 5312, 6432, etc. The player is given 12 tries to guess the code, and after each guess a clue is given which indicates whether each number in the guess is 1) the correct number in the correct place, 2) the correct number in the incorrect place, or 3) an incorrect number not in the code at all. Using these clues, the player can determine how to change their guess until eventually the code is either guessed or not. The player also has the option to create a code for the computer to guess, in which all the player does is choose a 4 digit code with similar restrictions as above, and the computer attempts to guess it within 12 rounds. 

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
3. player 
    - create code for computer to guess