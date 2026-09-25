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

  // Get moves
  String move1 = getMove(player1);

  // Hide Player 1's move
  for (int i = 0; i < 30; i++) {
    print('');
  }

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

  if (result == null) {
    print('Result: It\'s a draw!');
  } else {
    print('Result: $result wins!');
  }
}
