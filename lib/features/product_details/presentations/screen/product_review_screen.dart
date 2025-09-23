import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widget/ratingbar.dart';
import '../widget/ratingprogressmain.dart';
import '../widget/reviewList.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});
  static const path = '/product-review';

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
            Gap(10),
            RatingProgressMain(),
            CRatingbar(rating: 3,),
            Gap(24),
            ReviewList(),
            Gap(20),
            TextField(
              controller: controller,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Write your review...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
            Gap(10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Submit review
                },
                style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(300, 50)),
                ),
                child: Text('Submit'),
              ),
            ),




          ],
        ),
        ),
      ),
    );
  }
}







