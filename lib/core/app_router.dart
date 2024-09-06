import 'package:flutter/material.dart';
import 'package:simple_game/presentation/screens/empty_screen.dart';
import 'package:simple_game/presentation/screens/game_screen.dart';
import 'package:simple_game/presentation/screens/select_level_screen.dart';
import 'package:simple_game/presentation/screens/splash_screen.dart';

import '../bloc/game_bloc/game_bloc.dart';

class RouterWelcome {
  RouterWelcome._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routePath:
        return CustomRoute(page: const SplashScreen());
      case GameScreen.routePath:
        return CustomRoute(
            page: GameScreen(level: settings.arguments as GameLevel));
      case SelectLevelScreen.routePath:
        return CustomRoute(page: const SelectLevelScreen());
      default:
        return CustomRoute(page: const EmptyScreen());
    }
  }
}

class CustomRoute extends PageRouteBuilder {
  final Widget page;
  CustomRoute({required this.page})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(curve: Curves.easeIn, parent: animation)),
            child: child,
          ),
        );
}
