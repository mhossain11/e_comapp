import 'package:e_comapp/core/extensions/widget_extensions.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/res/styles/colors.dart';
import '../controller/wishlist_controller.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key,
    required this.productList,
  });

  final Products productList;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {

  final WishListController wishListController = Get.find< WishListController>();
  late bool productIsFavourite;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<WishListController>(
        builder: (controller){


          productIsFavourite = controller.wishList.any(
                  (product)=>product.productUid == widget.productList.uid);

          //print(widget.productList.uid);

          return IconButton(
            onPressed: ()  async{
              if (productIsFavourite) {
                Get.snackbar('Success', 'This product is already in your wishlist');
            //remove Item
               /*await controller.removeFromWishList(
                 wishUid: widget.wishUid.toString(),
                  );
                   print('Product_UID2: ${widget.productList.uid.toString()}');
                   print('UID2: ${widget.catUid.toString()}');
                print("1$productIsFavourite");*/
              } else {

                await  controller.addToWishList(
                    productId: widget.productList.uid!,
                    imageId: widget.productList.images![0].uid!,
                    sizeId: widget.productList.sizes![0].uid!,
                    colorId: widget.productList.colors![0].uid! ,
                  );
                controller.fetchGetWishList();
               // productIsFavourite = false;
                print("2$productIsFavourite");
                print("3 added Wishlist");
              }
            },
            icon: Icon(
              productIsFavourite ? IconlyBold.heart : IconlyBroken.heart,
              color: Colours.lightThemeSecondaryColour,
            ),
          ).loading(controller.isAdding.value || false);
          //).loading(controller.isAdding.value || controller.isRemoving.value);
    });
  }

}
