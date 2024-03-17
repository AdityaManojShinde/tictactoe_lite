import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/provider/providers.dart';
import 'package:tictactoe/core/repository/game_repo.dart';
// ignore: unused_import
import 'package:tictactoe/data/models/models.dart';
import 'package:tictactoe/view/widgets/bottom_sheet.dart';

class GameRepositiry {
  GameRepositiry();
  final TicTacToe game = TicTacToe();
  final bottomSheet = CustomBottomSheet();
  final String messageX = 'Player X Won';
  final String messageO = 'Player O Won';
  final String messageDraw = "It's a Draw!";

  void play(
      {required WidgetRef ref, required int index, required BuildContext ctx}) {
    // ignore: unused_local_variable
    final gameBord = ref.read(gameBordProvider);
    // ignore: unused_local_variable
    final playerTurn = ref.read(turnProvider);
    final gamebordnotifier = ref.read(gameBordProvider.notifier);
    // toggle the player
    gamebordnotifier.togglePlayer(index, ref);

    checkIfPlayerWon(gameBord, playerTurn, ctx, ref);
  }

  void checkIfPlayerWon(
      List<Player> bord, PlayerTurn turn, BuildContext ctx, WidgetRef ref) {
    final won = game.checkWin(bord);
    final draw = game.checkDraw(bord);
    if (won) {
      if (turn == PlayerTurn.o) {
        bottomSheet.show(ctx: ctx, content: messageX, ref: ref, isDraw: false);
        ref.read(gameScoreProvider.notifier).incriment(0);
      } else if (turn == PlayerTurn.x) {
        bottomSheet.show(ctx: ctx, content: messageO, ref: ref, isDraw: false);
        ref.read(gameScoreProvider.notifier).incriment(1);
      }
    }

    if (draw) {
      bottomSheet.show(ctx: ctx, content: messageDraw, ref: ref, isDraw: true);
    }
  }
}
