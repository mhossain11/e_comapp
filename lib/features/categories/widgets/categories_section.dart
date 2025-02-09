import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../core/utils/core_utils.dart';
import '../presentation/controller/category_controller.dart';
import '../presentation/sub_category_screen/sub_category_screen.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});



  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  void initState() {
    super.initState();
    // Fetch categories using GetX Controller
    CoreUtils.postFrameCall(() => categoryController.getCategories());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colours.lightThemePrimaryColour,
            ),
          );
        } else if (controller.categoryList.isEmpty) {
          return const Center(
            child: Text('No categories found'),
          );
        } else {
          return SizedBox(
            width: double.infinity,
            height: 55,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryList.length,
              separatorBuilder: (_, __) => const Gap(8),
              itemBuilder: (context, index) {
                final category = controller.categoryList[index];
                return GestureDetector(
                  onTap: () {
                    {
                      final productItem = controller.categoryList[index];
                      Get.toNamed(AppRoutes.subCategoryScreen, arguments:{"productItem":productItem});
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category.name ?? '',
                            style: TextStyles.paragraphSubTextRegular1
                                .adaptiveColour(context),
                          ),
                        ),
                      ),
                    ],
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

