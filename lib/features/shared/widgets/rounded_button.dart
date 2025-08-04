import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/res/styles/text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.onPressed,
    required this.text,
    this.height,
    this.padding,
    this.textStyle,
    this.backgroundColour,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 66,
<<<<<<< HEAD
      width: double.maxFinite,
=======
      width:  double.maxFinite,
>>>>>>> e751dd7 ( product details screen change)
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColour,
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? TextStyles.buttonTextHeadingSemiBold.white,
        ),
      ),
    );
  }
}
