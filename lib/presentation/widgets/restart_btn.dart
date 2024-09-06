import 'package:flutter/material.dart';

class RestartBtn extends StatefulWidget {
  const RestartBtn({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  State<RestartBtn> createState() => _RestartBtnState();
}

class _RestartBtnState extends State<RestartBtn> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapCancel: handleTapCancel,
      onTapUp: handleTapUp,
      child: pressed
          ? Image.asset(
              'assets/images/button_restart_down.png',
              height: 44,
              width: 180,
            )
          : Image.asset(
              'assets/images/button_restart_up.png',
              height: 44,
              width: 180,
            ),
    );
  }
}
