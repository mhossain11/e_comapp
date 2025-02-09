import 'package:flutter/material.dart';

import '../../../core/res/styles/colors.dart';
import '../../../core/utils/core_utils.dart';

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.zero,
      child: ColoredBox(
        color: CoreUtils.adaptiveColour(
          context,
          darkModeColour: Colours.darkThemeDarkSharpColour,
          lightModeColour: Colors.white,
        ),
        child: const SizedBox(height: 1, width: double.maxFinite),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.zero;
}
