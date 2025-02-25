import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../homepage/presentation/widgets/items.dart';

class ProductGridView extends StatelessWidget {
  final List<Products>? item;
  final bool ignoring;
  final int crossAxisCount;
  const ProductGridView({super.key,
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
      
              return GestureDetector(
                onTap: (){
                  if (kDebugMode) {
                    print('${item![index].uid}');
                  }
                  Get.toNamed(AppRoutes.productDetailScreen,
                  arguments: {'productId':item![index].uid});
                },
                child: Items(
                  item: item![index],
                  ignoring: true,
                  priceIgnoring: true, ),
              );
          }),
    );
  }
}
