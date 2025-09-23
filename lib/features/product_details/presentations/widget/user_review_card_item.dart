import 'package:e_comapp/features/product_details/presentations/widget/ratingbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

import '../../domain/model/product_review_model.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.reviewItem});

  final ProductReviewModel reviewItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.blue,),
                Gap(24),
                Text(reviewItem.user!.fullName!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
              ],
            ),

            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
        ),
        //review
        Row(
          children: [
            CRatingbar(rating: reviewItem.rating!),
            Gap(10),
            Text(reviewItem.createdAt!,style: TextStyle(fontSize: 16),),
          ],
        ),
        Gap(20),
        ReadMoreText(
          reviewItem.review.toString(),
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText:  'show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue),
        ),
        Gap(20),
      ],
    );
  }
}


