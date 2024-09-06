import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_game/core/colors.dart';
import 'package:simple_game/bloc/game_bloc/game_bloc.dart';
import 'package:simple_game/presentation/widgets/game_button.dart';
import 'package:simple_game/presentation/widgets/restart_btn.dart';
import 'package:simple_game/presentation/widgets/timer_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.level,
  });

  final GameLevel level;

  static const routeName = 'game_screen';
  static const routePath = 'game_screen';

  static const buttonSize = 40.0;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameBloc bloc;
  Timer? _timer;
  int _time = 120;
  bool _isGameOver = false;

  @override
  void initState() {
    bloc = GameBloc(gameLevel: widget.level);
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  void _reStartTimer() {
    _timer?.cancel();
    _timer = null;
    _time = 120;
    _isGameOver = false;
    _startTimer();
  }

  void onTick(Timer timer) {
    _time--;
    if (_time == 0) {
      _timer?.cancel();
      _timer = null;
      _isGameOver = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == Status.stop) {
          _reStartTimer();
        }
      },
      child: BlocBuilder<GameBloc, GameState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.color1,
            body: _isGameOver
                ? Center(
                    child: Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Image.asset(
                          'assets/images/image_bg.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'GAME OVER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                height: 0.9,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 32),
                            RestartBtn(
                              onTap: () {
                                bloc.add(const GameEvent.restart());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
                : Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          'assets/images/image_smallbg.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            width: sqrt(state.buttons.length) *
                                    GameScreen.buttonSize +
                                (sqrt(state.buttons.length) - 1) * 16,
                            height: sqrt(state.buttons.length) *
                                    GameScreen.buttonSize +
                                (sqrt(state.buttons.length) - 1) * 16,
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                ...state.buttons.map((entity) => GameButton(
                                      key: ValueKey(entity.id),
                                      buttonEntity: entity,
                                      size: GameScreen.buttonSize,
                                      onTap: () {
                                        bloc.add(GameEvent.updateBtn(
                                            btnId: entity.id));
                                      },
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Image.asset(
                              'assets/images/image_smallbg_bottom.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TimerWidget(
                                  time: _time,
                                ),
                                RestartBtn(
                                  onTap: () {
                                    bloc.add(const GameEvent.restart());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
