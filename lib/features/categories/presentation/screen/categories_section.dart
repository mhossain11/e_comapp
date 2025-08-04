import 'package:e_comapp/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/categories_shimmer.dart';
import '../../widgets/categoriesProduct_Button.dart';
import '../controller/category_controller.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final CategoryController categoryController = Get.find<CategoryController>();
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return CategoriesShimmer();
        } else {
          return SizedBox(
            width: double.infinity,
            height: 55.h,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              itemCount: controller.productCategories.length,
              separatorBuilder: (_, _) => const Gap(8),
              itemBuilder: (context, index) {
                final categoryIndex = controller.productCategories[index];
                return GestureDetector(
                  onTap: () {
                    {
                      setState(() {
                        isSelected = index;
                      });
                      Get.toNamed(
                        AppRoutes.subCategoryScreen,
                        arguments: {"productItem": categoryIndex},
                      );
                    }
                  },
                  child: CategoriesProductButton(
                    name: categoryIndex.name!,
                    index: index,
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
