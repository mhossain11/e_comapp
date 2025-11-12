import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/res/media.dart';
import '../../../core/res/styles/colors.dart';

class CategoriesProductItems extends StatelessWidget {
  final Products item;
  final bool ignoring;
  final bool priceIgnoring;

  const CategoriesProductItems({
    super.key,
    required this.item,
    required this.ignoring,
    required this.priceIgnoring,
  });

  @override
  Widget build(BuildContext context) {
    final hasImages = (item.images?.isNotEmpty ?? false);
    final hasSizes = (item.sizes?.isNotEmpty ?? false);

    return Container(
      width: 160.w,
      height: 220.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🖼️ Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: hasImages
                  ? CachedNetworkImage(
                imageUrl: item.images![0].image ?? '',
                height: 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 120.h,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image, color: Colors.grey),
              )
                  : Container(
                height: 120.h,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported,
                    size: 40, color: Colors.grey),
              ),
            ),

            const Gap(6),

            // 🏷️ Product Name
            Text(
              item.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const Gap(4),

            // ⭐ Rating
            if (ignoring)
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 14.sp,
                unratedColor: Colors.grey.shade300,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colours.lightThemePrimaryTextColour,
                ),
                onRatingUpdate: (rating) {},
              ),

            const Gap(4),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.sizes![0].mainPrice.toString(),
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Image.asset(Media.takaPng, height: 12.h),
                    ],
                  ),
                  SizedBox(width: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.sizes![0].discountPrice.toString(),
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Image.asset(Media.takaPng, height: 12.h),
                    ],
                  ),
                ],
              ),

            // 💵 Discount Price


          ],
        ),
      ),
    );
  }
}
