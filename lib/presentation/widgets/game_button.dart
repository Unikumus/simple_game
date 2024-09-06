import 'package:flutter/material.dart';
import 'package:simple_game/domain/models/button_entity.dart';

class GameButton extends StatefulWidget {
  const GameButton({
    super.key,
    required this.buttonEntity,
    required this.size,
    required this.onTap,
  });

  final ButtonEntity buttonEntity;
  final double size;
  final VoidCallback onTap;

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
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

  Widget wrapButton(AssetImage img) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          fit: BoxFit.fill,
          width: widget.size,
          height: widget.size,
          image: img,
          child: InkWell(
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }

  Widget buildNumericBtn(int number) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapCancel: handleTapCancel,
      onTapUp: handleTapUp,
      child: pressed
          ? Image.asset(
              'assets/images/btn_down_$number.png',
              width: widget.size,
              height: widget.size,
            )
          : Image.asset(
              'assets/images/btn_up_$number.png',
              width: widget.size,
              height: widget.size,
            ),

      // _btnSkin(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.buttonEntity.type) {
      ButtonType.empty => SizedBox(
          width: widget.size,
          height: widget.size,
        ),
      ButtonType.dummy => buildNumericBtn(0),
      ButtonType.numeric => switch (widget.buttonEntity.count) {
          1 => buildNumericBtn(1),
          2 => buildNumericBtn(2),
          3 => buildNumericBtn(3),
          4 => buildNumericBtn(4),
          5 => buildNumericBtn(5),
          int() => SizedBox(
              width: widget.size,
              height: widget.size,
            ),
        },
    };
  }
}
