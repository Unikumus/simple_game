import 'package:flutter/material.dart';
import 'package:simple_game/core/colors.dart';
import 'package:simple_game/presentation/screens/select_level_screen.dart';

const _duration = Duration(milliseconds: 2000);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash_screen';
  static const routePath = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curvedAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutCirc);
    _scaleAnimation = Tween(begin: 1.5, end: 1.0).animate(_curvedAnimation);

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        Navigator.of(context).pushNamed(SelectLevelScreen.routeName);
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.color2,
                  AppColors.color3,
                ],
                center: Alignment.center,
                radius: 0.6,
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (_, __) {
                  return Opacity(
                    opacity: _curvedAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: const Text(
                        'THE GAME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          height: 0.9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
