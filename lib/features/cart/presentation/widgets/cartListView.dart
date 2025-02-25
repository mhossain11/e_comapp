import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:flutter/cupertino.dart';

import 'cart_items.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.item});

  final List<CartsItems> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: item.length,
        itemBuilder: (context,index){
        var itemList = item[index];
          return CartItems(item: itemList,);

        });
  }
}
