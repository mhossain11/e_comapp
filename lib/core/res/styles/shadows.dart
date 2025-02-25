import 'package:flutter/cupertino.dart';

import 'colors.dart';

class ShadowStyle{

  static final verticalProductShadow =BoxShadow(
    color: Colours.drColor.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow =BoxShadow(
      color: Colours.drColor.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}