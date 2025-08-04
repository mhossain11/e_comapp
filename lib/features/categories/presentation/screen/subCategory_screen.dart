import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/core/res/styles/text.dart';
import 'package:e_comapp/features/categories/widgets/categoriesProduct_items.dart';
import 'package:e_comapp/features/shared/widgets/item.dart';
import 'package:e_comapp/features/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/categoriesProduct_Button.dart';
import '../../domain/model/CategoryModel.dart';
import '../../widgets/categoriesProduct_gridview.dart';
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
        /*actions: [
          IconButton(onPressed: (){
            Get.to(() => const WishListScreen());
          }, icon: const Icon(Icons.favorite_border)) //Single page show not dashboard show
        ],*/
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
                      final subCategory = widget.productItem.subcategories![index];

                      return GestureDetector(
                        onTap: () {
                           setState(() {
                            categoryController.index.value = index;
                          });
                          categoryController.clickSubItem.value = true;
                        },
                        child: CategoriesProductButton(name: subCategory.name!,index: index,isSelected:categoryController.index.value ,),
                      );
                    },
                  ),
                ),
                const Gap(10),
                if(widget.productItem.subcategories![categoryController.index.value].products!.isEmpty )
                  const Center(child: Text(" Item is Empty")),
                if(widget.productItem.subcategories![categoryController.index.value].products!.isNotEmpty )
                 Card(
                   elevation: 5,
                   color: Colors.white24,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                   child: Center(child: Text('${widget.productItem.subcategories![categoryController.index.value].name}',
                     style:const TextStyle(fontSize: 16,color: Colors.black,) ,)),
                 ),
                  CategoriesProductGridView(
                    item: widget.productItem.subcategories![categoryController.index.value].products,
                    ignoring: true,
                    crossAxisCount: 2,
                  ),

              ],
            );
          }
          else {
            return const SizedBox();
          }
        }

      ),
    );
  }
}
