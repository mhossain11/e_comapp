import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/model/specialCategoryProduct_model.dart';

class AllViewCategoryScreen extends StatelessWidget {
  const AllViewCategoryScreen({
    super.key,
    required this.products,
    required this.categoryName,
  });

  static const path = '/allViewCategoryScreen';

  final List<SpecialCategoryProductModel> products;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRoutes.productDetailScreen,
                  arguments: {'productId': product.productUid},
                );
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Container(
                  width: 160.w,
                  height: media.width * 0.3,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      if (product.productImage == null ||
                          product.productImage!.isEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: media.width * 0.3,
                          ),
                        )
                      else
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: product.productImage ?? '',
                            height: 160.h, // .h লাগবে না, already logical pixels
                            width: 160.w,
                            fit: BoxFit.cover,

                            // Placeholder with shimmer
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: media.width * 0.40,
                                width: 160.w,
                                color: Colors.white,
                              ),
                            ),

                            // Error widget
                            errorWidget: (context, url, error) => const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),

                        ),
                      SizedBox(height: 8.h),
                      Text(
                        product.productName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '৳${ product.mainPrice}',
                            maxLines: 2,
                            overflow:TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration:TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '৳${product.discountPrice ?? product.mainPrice}',
                            maxLines: 2,
                            overflow:TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(
                        width: 100.w,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size.zero, // Important to remove default min constraints
                            fixedSize: Size(100.w, 50.h), // fix size exactly
                          ),
                          child: const Text(
                            'Add to Cart',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}