import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/provider/providers.dart';

class GameScore extends ConsumerWidget {
  const GameScore({
    super.key,
    required this.scoreX,
    required this.scoreO,
  });
  final String scoreX;
  final String scoreO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(gameScoreProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$scoreX : ${score[0]}',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: score[0] > score[1] ? Colors.lightGreen : Colors.red),
        ),
        Text('O : ${score[1]}',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: score[0] < score[1] ? Colors.lightGreen : Colors.red)),
      ],
    );
  }
}
