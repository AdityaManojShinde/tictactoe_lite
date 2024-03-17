import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/provider/providers.dart';
import 'package:tictactoe/core/repository/game.dart';

class GameGrid extends ConsumerWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameBord = ref.watch(gameBordProvider);
    return GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              final game = GameRepositiry();
              game.play(ref: ref, index: index, ctx: context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: 50,
              width: 50,
              child: gameBord[index].imagePath.isNotEmpty
                  ? Image.asset(
                      gameBord[index].imagePath,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            )));
  }
}
