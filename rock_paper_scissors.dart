import 'dart:io';

/// Gets the player's name.
String getName(String defaultName) {
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    return defaultName;
  }

  return input.trim();
}

/// Checks if the move is valid.
String? checkMove(String input) {
  List<String> moves = ['rock', 'paper', 'scissors'];

  String move = input.trim().toLowerCase();

  if (moves.contains(move)) {
    return move;
  }

  return null;
}

/// Gets a valid move from the player.
String getMove(String name) {
  String? move;

  do {
    print('$name, enter your move:');

    String? input = stdin.readLineSync();

    move = checkMove(input ?? '');

    if (move == null) {
      print('Invalid move. Try again.');
    }
  } while (move == null);

  return move;
}

/// Decides who wins the round.
String? winner(
    String player1,
    String player2,
    String move1,
    String move2) {

  if (move1 == move2) {
    return null;
  }

  if ((move1 == 'rock' && move2 == 'scissors') ||
      (move1 == 'paper' && move2 == 'rock') ||
      (move1 == 'scissors' && move2 == 'paper')) {
    return player1;
  }

  return player2;
}

void main() {

  print('===== ROCK, PAPER, SCISSORS =====');

  // Get names
  print('Enter Player 1 name:');
  String player1 = getName('Player 1');

  print('Enter Player 2 name:');
  String player2 = getName('Player 2');

  int score1 = 0;
  int score2 = 0;

  String playAgain;

  // Game loop
  do {
    print('');
    print('--- NEW ROUND ---');

    // Player 1
    String move1 = getMove(player1);

    // Hide Player 1's move
    for (int i = 0; i < 30; i++) {
      print('');
    }

    // Player 2
    String move2 = getMove(player2);

    // Show moves
    print('$player1 chose $move1.');
    print('$player2 chose $move2.');

    // Find winner
    String? result = winner(
      player1,
      player2,
      move1,
      move2,
    );

    // Score
    if (result == null) {
      print('Result: It\'s a draw!');
    } else {
      print('Result: $result wins!');

      if (result == player1) {
        score1++;
      } else {
        score2++;
      }
    }

    print('Score: $player1 $score1 | $player2 $score2');

    // Play again
    print('Play again? (y/n):');

    String? answer = stdin.readLineSync();

    playAgain = (answer ?? 'n').trim().toLowerCase();

  } while (playAgain == 'y');

  // Final score
  print('');
  print('===== FINAL SCORE =====');
  print('$player1: $score1 | $player2: $score2');

  if (score1 > score2) {
    print('Overall winner: $player1');
  } else if (score2 > score1) {
    print('Overall winner: $player2');
  } else {
    print('Overall winner: It\'s a draw!');
  }
}
