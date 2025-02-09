import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bestseller_from.dart';
import '../../../categories/presentation/controller/category_controller.dart';

class CategoryListProducts extends StatelessWidget {
  const CategoryListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find<CategoryController>();

    return GetBuilder<CategoryController>(
      builder: (controller) {
          return  ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 320,
                child: SellerItemFrom(
                  onPressed: () {

                    // Get.toNamed(CategoryLists.path,arguments:{'item': bestList,'name':'Bestsellers Product'});
                  },
                  txt: controller.categoryList[index].name!,
                  itemCount: controller.categoryList.length,
                  items: controller.categoryList[index].subcategories![index].products!,
                  rating: true,
                ),
              );
            },
          );
        }
    );



  }
}
