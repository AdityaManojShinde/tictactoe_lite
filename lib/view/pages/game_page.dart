import 'package:flutter/material.dart';
import 'package:tictactoe/view/widgets/back_button.dart';
import 'package:tictactoe/view/widgets/game_grid.dart';
import 'package:tictactoe/view/widgets/game_score.dart';
import 'package:tictactoe/view/widgets/player_turn_chip.dart';
import 'package:tictactoe/view/widgets/reset_button.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  static const String route = '/game';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PlayerTurnChip(),
        centerTitle: true,
        leading: const MyBackButton(),
        actions: const [ResetButton()],
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: Padding(
              padding: EdgeInsets.all(10),
              // Too big name throws an error
              child: FittedBox(child: GameScore()),
            )),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: GameGrid(),
                ),
              ),
            ],
          );
        }
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: GameGrid(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
