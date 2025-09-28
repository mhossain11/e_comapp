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


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? action;
  final VoidCallback? txtOnPressed;
  final bool showBackArrow;
  final String text;
  final bool centerTitle;

  const CustomAppBar({super.key,
    required this.txtOnPressed,
    this.action,
    this.showBackArrow =false,
    required this.text,
    this.centerTitle = false });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackArrow ?IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios)):const SizedBox(),
      title: TextButton(
        onPressed: txtOnPressed,
        child: Text(text,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500)),),
      backgroundColor: Colours.primary,
      centerTitle: centerTitle,
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}