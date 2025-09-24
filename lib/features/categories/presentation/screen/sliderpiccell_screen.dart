import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../shared/widgets/circularContainer.dart';
import '../controller/category_controller.dart';

class SliderPickCellScreen extends StatelessWidget {
  const SliderPickCellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    final CategoryController categoryController = Get.find<CategoryController>();

    return GetBuilder<CategoryController>(
      builder: (controller) {
        // print('Slider: ${categoryController.sliderList.length}');
        if (controller.isLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 185.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 185.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    onPageChanged: (index, _) {
                      controller.updatePageIndicator(index);
                    },
                  ),
                  items:
                      controller.sliderList
                          .map(
                            (item) => Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: item.image!,
                                  fit: BoxFit.fitWidth,
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      height: 150.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => const Center(
                                    child: Icon(Icons.broken_image),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (
                      int i = 0;
                      i < categoryController.sliderList.length;
                      i++
                    )
                      CircularContainer(
                        width: 5.w,
                        height: 4.h,
                        color:
                            controller.sliderIndex.value == i
                                ? Colors.blue
                                : Colors.grey,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
