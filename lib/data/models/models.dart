class Player {
  Player({this.turn = PlayerTurn.none, this.imagePath = ''});
  PlayerTurn turn;
  String imagePath;
}

enum PlayerTurn { o, x, none }
