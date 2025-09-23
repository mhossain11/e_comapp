
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/helper_functions.dart';

class RatingProgressIndicator extends StatelessWidget {
   RatingProgressIndicator({
    super.key,
     required this.value,
     required this.text
  });

 final String text;
 final double value;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex:1,child: Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: HelperFunctions.screenWidth() * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}