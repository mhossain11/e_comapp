
import 'package:flutter/material.dart';

class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  final double radious;
  final double shapeRadious;
  final VoidCallback press;
  final bool isPressed;
  final double fontSize;
  const TwoSideRoundedButton({
    super.key,
    required this.text,
    this.radious = 29,
    required this.press,
    this.fontSize =12,
    this.shapeRadious=32,
    this.isPressed = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(shapeRadious),
          bottomRight: Radius.circular(shapeRadious),
        ),
        splashColor: Colors.grey.withOpacity(0.6),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.identity()..scale(isPressed ? 0.95 : 1.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radious),
              bottomRight: Radius.circular(radious),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize,color: Colors.white),
            ),
          ),
        )
      ),
    );
  }
}

