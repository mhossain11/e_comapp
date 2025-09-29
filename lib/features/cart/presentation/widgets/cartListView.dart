import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/cart_controller.dart';
import 'cart_items.dart';

class CartListView extends StatelessWidget {
  CartListView({super.key,});
   final CartController cartController = Get.find<CartController>();




  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartController.cartList.length,
          itemBuilder: (context,index){
          var itemList = cartController.cartList[index];
            return CartItems(item: itemList,);

          }),
    );
  }
}
