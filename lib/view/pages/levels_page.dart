import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/view/widgets/back_button.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  static const String route = '/levels';
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final buttonW = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicWidth(
              child: SizedBox(
                width: buttonW,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/game');
                    },
                    child: const Text('Level Infinity')),
              ),
            ),
            IntrinsicWidth(
              child: SizedBox(
                width: buttonW,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/game');
                    },
                    child: const Text('Set A Match')),
              ),
            ),
            IntrinsicWidth(
              child: SizedBox(
                width: buttonW,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/game');
                    },
                    child: const Text('Player vs Ai')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
