import 'package:tictactoe/data/models/models.dart';

abstract class Game {
  bool checkWin(List<Player> bord);
  bool checkDraw(List<Player> bord);
}

class TicTacToe implements Game {
  final winningConditions = [
    // row wise
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    //column wise
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // cross
    [0, 4, 8],
    [6, 4, 2],
  ];

  @override
  bool checkDraw(List<Player> bord) {
    for (Player player in bord) {
      if (player.turn == PlayerTurn.none) {
        return false;
      }
    }
    return true;
  }

  @override
  bool checkWin(List<Player> bord) {
    for (final con in winningConditions) {
      if (bord[con[0]].turn != PlayerTurn.none &&
          bord[con[0]].turn == bord[con[1]].turn &&
          bord[con[1]].turn == bord[con[2]].turn) {
        // player won
        return true;
      }
    }
    return false;
  }
}
