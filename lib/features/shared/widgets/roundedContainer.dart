import 'package:flutter/cupertino.dart';

import '../../../core/res/styles/colors.dart';
import '../../../core/res/styles/sizes_padding.dart';

class RoundedContainer extends StatelessWidget {
   const RoundedContainer({super.key,
    this.width,
    this.height,
    this.radius =SizesPadding.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = Colours.wColor,
    this.backgroundColor =Colours.wColor ,
    this.padding,
    this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor):null,
      ),
      child: child,
    );
  }
}
