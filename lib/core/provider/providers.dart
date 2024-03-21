import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/data/models/models.dart';
import 'package:tictactoe/data/src/img.dart';

class GameBord extends StateNotifier<List<Player>> {
  GameBord() : super(List.generate(9, growable: false, (index) => Player()));

  void gameReset() {
    state = List.generate(9, growable: false, (index) => Player());
    state = [...state];
  }

  void togglePlayer(int index, WidgetRef ref) {
    // ignore: unused_local_variable
    final playerTurn = ref.read(turnProvider);
    // toggle between x and o
    if (playerTurn == PlayerTurn.none) {
      state[index] = Player(
        turn: PlayerTurn.x,
        // update the image path
        imagePath: Img.playerX,
      );
      state = [...state];
      ref.read(turnProvider.notifier).update((state) => PlayerTurn.x);
    } else if (playerTurn == PlayerTurn.x) {
      state[index] = Player(
        turn: PlayerTurn.o,
        // update the image path
        imagePath: Img.playerO,
      );
      state = [...state];
      ref.read(turnProvider.notifier).update((state) => PlayerTurn.o);
    } else if (playerTurn == PlayerTurn.o) {
      state[index] = Player(
        turn: PlayerTurn.x,
        // update the image path
        imagePath: Img.playerX,
      );
      state = [...state];
      ref.read(turnProvider.notifier).update((state) => PlayerTurn.x);
    }
  }
}

class GameScoreNotifier extends StateNotifier<List<int>> {
  GameScoreNotifier() : super([0, 0]);

  void incriment(int index) {
    state[index]++;
    state = [...state];
  }

  void reset() {
    state = [0, 0];
    state = [...state];
  }
}

final gameScoreProvider = StateNotifierProvider<GameScoreNotifier, List<int>>(
    (ref) => GameScoreNotifier());

final gameBordProvider =
    StateNotifierProvider<GameBord, List<Player>>((ref) => GameBord());

final turnProvider = StateProvider<PlayerTurn>((ref) => PlayerTurn.x);

final playerXNameProvider = StateProvider<String>((ref) => 'X');
final playerONameProvider = StateProvider<String>((ref) => 'O');
