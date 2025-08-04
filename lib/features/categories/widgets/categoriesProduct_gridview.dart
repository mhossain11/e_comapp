import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'categoriesProduct_items.dart';

class CategoriesProductGridView extends StatelessWidget {
  final List<Products>? item;
  final bool ignoring;
  final int crossAxisCount;
  const CategoriesProductGridView({super.key,
    required this.item,
    required this.ignoring,
    required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.60,//(200/256),
              crossAxisSpacing: 12,
              mainAxisSpacing:12,
              crossAxisCount: crossAxisCount),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: item!.length,
          itemBuilder:(context,index){
              if(item!.isEmpty){
               return const Center(child: Text(" Item is Empty"));
          }else {
                return GestureDetector(
                  onTap: (){
                    if (kDebugMode) {
                      print('${item![index].uid}');
                    }
                    Get.toNamed(AppRoutes.productDetailScreen,
                        arguments: {'productId':item![index].uid});
                  },
                  child: CategoriesProductItems(
                    item: item![index],
                    ignoring: true,
                    priceIgnoring: true, ),
                );
              }
    }

              ),
    );
  }
}
