import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/router/app_router.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../product_details/presentations/screen/product_details.dart';
import '../../domain/model/specialCategoryProduct_model.dart';
import '../controller/category_controller.dart';
import 'allViewCategory_screen.dart';

class SpecialCategoryProductScreen extends StatefulWidget {
  const SpecialCategoryProductScreen({super.key});

  static const path = '/specialCategoryScreen';

  @override
  State<SpecialCategoryProductScreen> createState() => _SpecialCategoryProductScreenState();
}

class _SpecialCategoryProductScreenState extends State<SpecialCategoryProductScreen> {
  final CartController cartController = Get.find<CartController>();

  final CategoryController categoryController = Get.find<CategoryController>();

  bool addToCart=false;

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (categoryController.isLoading.value) {
        return SizedBox(
          width: double.infinity,
          height: 280.h,
          child: buildShimmerList(),
        );
        // return
      } else {
        return SingleChildScrollView(
          child: buildGroupedLists(
            categoryController.specialCategoryProductList,
            context,
          ),
        );
      }
    });
  }

  Widget buildShimmerList() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 20.h,
                width: 120.w,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 280.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder:
                    (_, __) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 160.w,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildGroupedLists(List<SpecialCategoryProductModel> productList, context) {

    final grouped = <String, List<SpecialCategoryProductModel>>{};
    var media = MediaQuery.of(context).size;

    for (var product in productList) {
      final name = product.specialCategory?.name ?? '';
      grouped.putIfAbsent(name, () => []).add(product);
    }

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children:
          grouped.entries.map((entry) {
            final categoryName = entry.key;
            final productsList = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        categoryName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: media.width *0.3,
                        height: 50,
                        child: TextButton(
                            onPressed: (){
                              Get.toNamed(
                                AppRoutes.allViewCategoryScreen,
                                arguments: {
                                  'products': productsList,
                                  'categoryName': categoryName,
                                },
                              );
                            },
                            child: const Text('See More',style: TextStyle(color: Colors.blue),)),
                      )
                    ],
                  ),
                ),
               SizedBox(
                      height: 310.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsList.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final productIndex = productsList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.productDetailScreen,
                                arguments: {'productId': productIndex.productUid},
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
                                height: media.width * 0.3.h,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    if (productIndex.productImage == null ||
                                        productIndex.productImage!.isEmpty)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          width: 160.w,
                                          height: media.width * 0.40,
                                        ),
                                      )
                                    else
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          productIndex.productImage ?? '',
                                          height: media.width * 0.40.h,
                                          width: 160.w,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (_, __, ___) =>
                                                  const Icon(Icons.broken_image),
                                        ),
                                      ),
                                     SizedBox(height: 8.h),
                                    Text(
                                      productIndex.productName ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                     SizedBox(height: 4.h),
                                    Text(
                                      '৳${productIndex.discountPrice ?? productIndex.mainPrice}',
                                      maxLines: 2,
                                      overflow:TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    SizedBox(
                                      width: 100.w,
                                      height: 50.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          cartController.addToCart(
                                              productUid: productIndex.productUid!,
                                              imageUid: productIndex.productImage!,
                                              sizeUid: productIndex.sizeName!,
                                              colorUid: productIndex.productColors!,
                                              quantity: cartController.quantity.value
                                          );
                                          addToCart=true;
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          minimumSize: Size.zero, // Important to remove default min constraints
                                          fixedSize: Size(100.w, 50.h), // fix size exactly
                                        ),
                                        child: Text(
                                          addToCart ?'Added to Cart' :'Add to Cart',
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
              ],
            );
          }).toList(),
    );
  }
}
