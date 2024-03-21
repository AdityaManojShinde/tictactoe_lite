import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/provider/providers.dart';
import 'package:tictactoe/data/models/models.dart';

class PlayerTurnChip extends ConsumerStatefulWidget {
  const PlayerTurnChip({super.key});

  @override
  ConsumerState<PlayerTurnChip> createState() => _PlayerTurnChipState();
}

class _PlayerTurnChipState extends ConsumerState<PlayerTurnChip> {
  @override
  Widget build(BuildContext context) {
    final turn = ref.watch(turnProvider);

    return Chip(
      label: Text('Player Turn : ${turn == PlayerTurn.o ? "X" : "O"}'),
    );
  }
}
