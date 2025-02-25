import 'package:flutter/material.dart';

import '../../../core/res/styles/colors.dart';
import '../../../core/res/styles/text.dart';

class EmptyData extends StatelessWidget {
  const EmptyData(this.data, {super.key, this.padding});

  final String data;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: TextStyles.headingBold.copyWith(
              color: Colors.black.withOpacity(.4),fontSize: 17),
        ),
      ),
    );
  }
}
