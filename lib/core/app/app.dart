import 'package:flutter/material.dart';
import 'package:tictactoe/data/src/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(),
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
