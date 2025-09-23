import 'package:e_comapp/features/product_details/presentations/widget/rating_prograss_indecator.dart';
import 'package:flutter/material.dart';

class RatingProgressMain extends StatelessWidget {
  const RatingProgressMain({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.5',style: TextStyle(fontSize: 48,fontWeight: FontWeight.w500),)),

        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(value: 1.0, text: '5',),
              RatingProgressIndicator(value: 0.8, text: '4',),
              RatingProgressIndicator(value: 0.6, text: '3',),
              RatingProgressIndicator(value: 0.4, text: '2',),
              RatingProgressIndicator(value: 0.2, text: '1',)
            ],
          ),
        )
      ],
    );
  }
}