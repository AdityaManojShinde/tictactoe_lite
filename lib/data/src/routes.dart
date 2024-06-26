import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/view/pages/form_page.dart';
import 'package:tictactoe/view/pages/game_page.dart';
import 'package:tictactoe/view/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      // change this after dev
      path: HomePage.route,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: GamePage.route,
      builder: (BuildContext context, GoRouterState state) {
        return const GamePage();
      },
    ),
    GoRoute(
      path: FormPage.route,
      builder: (BuildContext context, GoRouterState state) {
        return const FormPage();
      },
    ),
  ],
);
