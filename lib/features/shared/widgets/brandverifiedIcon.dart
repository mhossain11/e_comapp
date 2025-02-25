
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/res/styles/colors.dart';
import '../../../core/utils/enums/enums.dart';
import 'brandTitle_text.dart';


class BrandVerifiedIcon extends StatelessWidget {
   const BrandVerifiedIcon({super.key,
    required this.title,
    this.maxLines =1,
    this.textColor,
    this.iconColor = Colours.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor,iconColor ;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: BrandTitleText(
          title: title,
          maxLines: maxLines,
          color: textColor,
          textAlign: textAlign,
          brandTextSize: brandTextSize,

        )
        ),
        const SizedBox(width: 4,),
        Icon(Icons.verified,color: iconColor,size: 12,)

      ],
    );
  }
}
