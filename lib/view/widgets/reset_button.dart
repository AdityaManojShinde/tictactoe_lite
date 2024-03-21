import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/view/widgets/dialog_box.dart';

class ResetButton extends ConsumerWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialog = GameDialog();
    return IconButton(
      onPressed: () {
        dialog.showResetDialog(
            ref: ref,
            ctx: context,
            content: 'Are you sure you want reset this match?');
      },
      icon: const Icon(Icons.restore),
    );
  }
}
