import 'package:flutter/material.dart';
import 'package:simple_game/bloc/game_bloc/game_bloc.dart';
import 'package:simple_game/presentation/widgets/level_btn.dart';

import 'game_screen.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({super.key});

  static const routeName = 'select_level_screen';
  static const routePath = 'select_level_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              'assets/images/image_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Let's\nplay the Game",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  height: 0.9,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Select level",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  height: 0.9,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 32),
              LevelBtn.simple(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(
                        level: GameLevel.simple,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              LevelBtn.medium(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(
                        level: GameLevel.medium,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              LevelBtn.hard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(
                        level: GameLevel.hard,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
