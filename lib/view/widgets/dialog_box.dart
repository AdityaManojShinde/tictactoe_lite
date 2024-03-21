import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/provider/providers.dart';

class GameDialog {
  void showResetDialog(
      {required WidgetRef ref,
      required BuildContext ctx,
      required String content}) {
    showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              content: Text(content),
              actionsAlignment: MainAxisAlignment.center,
              contentPadding: const EdgeInsets.all(20),
              actions: [
                FilledButton(
                    onPressed: () {
                      ref.read(gameBordProvider.notifier).gameReset();
                      ref.read(gameScoreProvider.notifier).reset();
                      Navigator.pop(ctx);
                    },
                    child: const Text('Yes')),
                FilledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Cancel')),
              ],
            ));
  }

  void showExitDialog(
      {required WidgetRef ref,
      required BuildContext ctx,
      required String content}) {
    showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              content: Text(content),
              contentPadding: const EdgeInsets.all(20),
              actions: [
                FilledButton(
                    onPressed: () {
                      ref.read(gameBordProvider.notifier).gameReset();
                      ref.read(gameScoreProvider.notifier).reset();
                      ref
                          .read(playerONameProvider.notifier)
                          .update((state) => '');
                      ref
                          .read(playerXNameProvider.notifier)
                          .update((state) => '');
                      ctx.go('/');
                    },
                    child: const Text('Yes')),
                FilledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Cancel')),
              ],
            ));
  }
}
