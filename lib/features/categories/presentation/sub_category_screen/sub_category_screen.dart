import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/core/res/styles/text.dart';
import 'package:e_comapp/features/homepage/presentation/widgets/items.dart';
import 'package:e_comapp/features/shared/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../domain/model/CategoryModel.dart';
import '../../widgets/product_gridview.dart';
import '../controller/category_controller.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen(this.productItem,{super.key});

  final ProductCategoriesModel productItem;

    static const path ='/subCategoryScreen';

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find<CategoryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productItem.name.toString()),
      ),
      body: GetBuilder<CategoryController>(
        builder: (controller) {
          if (widget.productItem.subcategories!.isEmpty) {
            return const Center(child: Text('Item is Empty'));
          }else if(widget.productItem.subcategories!.isNotEmpty){
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productItem.subcategories!.length,
                    separatorBuilder: (_, __) => const Gap(8),
                    itemBuilder: (context, index) {
                      final subCategory = widget.productItem
                          .subcategories![index];

                      return GestureDetector(
                        onTap: () {
                          // index = index;
                          //Get.toNamed(SubCategoryScreen.path, arguments: category);
                          setState(() {
                            categoryController.index.value = index;
                            // categoryController.productList.add(subCategory.products![index]) ;
                          });
                          // print('Index:${categoryController.index.value} & $index');
                          categoryController.clickSubItem.value = true;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Card(
                              elevation: 5,
                              // color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  subCategory.name ?? '',
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
                ),
                const Gap(10),
                if(widget.productItem.subcategories![categoryController.index.value].products!.isEmpty )
                  const Center(child: Text(" Item is Empty")),
                if(widget.productItem.subcategories![categoryController.index.value].products!.isNotEmpty )
                  ProductGridView(
                    item: widget.productItem.subcategories![categoryController.index.value].products,
                    ignoring: true,
                    crossAxisCount: 2,
                  ),

              ],
            );
          }
          else {
            return SizedBox();
          }
        }

      ),
    );
  }
}
