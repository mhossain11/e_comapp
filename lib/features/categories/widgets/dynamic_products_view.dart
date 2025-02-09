/*
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../auth/domains/models/ProductCategoryModel.dart';

class DynamicProductsView extends StatefulWidget {
  const DynamicProductsView({super.key});

  @override
  State<DynamicProductsView> createState() => _DynamicProductsViewState();
}

class _DynamicProductsViewState extends State<DynamicProductsView> {

  final pageController = PagingController<int,Products>(firstPageKey: 1);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(()=>pageController.refresh()),
      child: PagedMasonryGridView<int,Products>.count(
          pagingController: pageController,
           crossAxisCount: 2,
          builderDelegate: PagedChildBuilderDelegate<Products>(
              itemBuilder: (context,product,index)=>Center(
                child: ,
              )),
          gridDelegateBuilder: gridDelegateBuilder, ),

    );
  }
}
*/
