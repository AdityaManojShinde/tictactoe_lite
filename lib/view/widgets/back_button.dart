import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';
import 'package:tictactoe/view/widgets/dialog_box.dart';

class MyBackButton extends ConsumerWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialog = GameDialog();
    return IconButton(
        onPressed: () {
          dialog.showExitDialog(
              ref: ref, ctx: context, content: 'Are you want exit this match?');
        },
        icon: const Icon(Icons.arrow_back_ios));
  }
}
