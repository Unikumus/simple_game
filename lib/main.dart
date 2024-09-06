import 'package:flutter/material.dart';
import 'package:simple_game/presentation/screens/game_screen.dart';
import 'package:simple_game/presentation/screens/splash_screen.dart';

import 'core/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routePath,
      onGenerateRoute: (RouteSettings settings) =>
          RouterWelcome.generateRoute(settings),
    );
  }
}
