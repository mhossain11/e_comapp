import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/cart_controller.dart';
import 'cart_items.dart';

class CartListView extends StatefulWidget {
   const CartListView({super.key, required this.item });

  final List<CartsItems> item;


  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  int  totalItems=0;
  final CartController cartController = Get.find<CartController>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      totalItems = cartController.cartList.fold(0, (sum, item) => sum + item.quantity);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.item.length,
        itemBuilder: (context,index){
        var itemList = widget.item[index];
          return CartItems(item: itemList,);

        });
  }
}
