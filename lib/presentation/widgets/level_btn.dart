import 'package:flutter/material.dart';

enum _LevelType {
  simple,
  medium,
  hard,
}

extension on _LevelType {
  int get id {
    switch (this) {
      case _LevelType.simple:
        return 1;
      case _LevelType.medium:
        return 2;
      case _LevelType.hard:
        return 3;
    }
  }
}

class LevelBtn extends StatefulWidget {
  const LevelBtn.simple({
    super.key,
    required this.onTap,
  }) : _type = _LevelType.simple;

  const LevelBtn.medium({
    super.key,
    required this.onTap,
  }) : _type = _LevelType.medium;

  const LevelBtn.hard({
    super.key,
    required this.onTap,
  }) : _type = _LevelType.hard;

  final _LevelType _type;
  final VoidCallback onTap;

  @override
  State<LevelBtn> createState() => _LevelBtnState();
}

class _LevelBtnState extends State<LevelBtn> {
  bool pressed = false;

  void handleTapDown(_) {
    setState(() => pressed = true);
  }

  void handleTapCancel() {
    setState(() => pressed = false);
  }

  void handleTapUp(_) {
    widget.onTap.call();
    setState(() => pressed = false);
  }

  static const double _width = 180;
  static const double _height = 44;

  Widget buildLevelBtn(int number) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapCancel: handleTapCancel,
      onTapUp: handleTapUp,
      child: pressed
          ? Image.asset(
              'assets/images/level_btn_down_$number.png',
              width: _width,
              height: _height,
            )
          : Image.asset(
              'assets/images/level_btn_up_$number.png',
              width: _width,
              height: _height,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildLevelBtn(widget._type.id);
  }
}
