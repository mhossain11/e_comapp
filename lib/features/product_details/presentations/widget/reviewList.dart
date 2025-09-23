import 'package:e_comapp/features/product_details/presentations/widget/user_review_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_details_controller.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailsController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          shrinkWrap: true, // important
          physics: const NeverScrollableScrollPhysics(), // important
          itemCount: controller.reviewList.length,
          itemBuilder: (context, index) {
            return UserReviewCard(
              reviewItem: controller.reviewList[index],
            );
          },
        );
      }
    });
  }
}
