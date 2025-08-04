import 'package:e_comapp/features/responcive/responsive_size.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;
  final Widget webBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.webBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody; // ✅ Mobile UI দেখাবে
        } else if (constraints.maxWidth < tabletWidth) {
          return tabletBody; // ✅ Tablet UI দেখাবে
        } else if (constraints.maxWidth < desktopWidth) {
          return desktopBody; // ✅ Desktop UI দেখাবে
        } else {
          return webBody; // ✅ Web UI দেখাবে
        }
      },
    );
  }
}
