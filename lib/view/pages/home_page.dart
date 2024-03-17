import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/data/src/img.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final Widget gameIcon = SizedBox(
        height: 200,
        width: 200,
        child: Image.asset(
          Img.gameIcon,
          fit: BoxFit.contain,
        ));
    final Widget playButton = Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton.icon(
          onPressed: () {
            context.go('/game');
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text('Play')),
    );
    return Scaffold(
      appBar: AppBar(),
      body:
          OrientationBuilder(builder: (BuildContext context, Orientation ori) {
        if (ori == Orientation.landscape) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [gameIcon, playButton],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: gameIcon), Center(child: playButton)],
        );
      }),
    );
  }
}
