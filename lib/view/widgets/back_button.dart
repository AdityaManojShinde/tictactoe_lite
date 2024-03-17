import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/provider/providers.dart';

class MyBackButton extends ConsumerWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          context.go('/');
          ref.read(gameBordProvider.notifier).gameReset();
          ref.read(gameScoreProvider.notifier).reset();
        },
        icon: const Icon(Icons.arrow_back_ios));
  }
}
