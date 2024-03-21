import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/provider/providers.dart';

class GameScore extends ConsumerWidget {
  const GameScore({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String scoreX = ref.read(playerXNameProvider);
    final String scoreO = ref.read(playerONameProvider);
    final score = ref.watch(gameScoreProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AutoSizeText(
          '${scoreX.isEmpty ? "X" : scoreX} : ${score[0]}',
          maxLines: 1,
          softWrap: true,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: score[0] > score[1] ? Colors.lightGreen : Colors.red),
        ),
        const SizedBox(
          width: 50,
        ),
        AutoSizeText('${scoreO.isEmpty ? "O" : scoreO} : ${score[1]}',
            maxLines: 1,
            softWrap: true,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: score[0] < score[1] ? Colors.lightGreen : Colors.red)),
      ],
    );
  }
}
