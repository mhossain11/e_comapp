import 'package:e_comapp/features/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/res/styles/colors.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key, required this.productId});
  final String productId;

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  late bool productIsFavourite;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
        builder: (controller){

          return IconButton(onPressed: (){}, icon: Icon(
            productIsFavourite ? IconlyBold.heart : IconlyBroken.heart,
            color: Colours.lightThemeSecondaryColour,
          ));
        });
  }
}
