
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/shadows.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
<<<<<<< HEAD
=======
import '../../../cart/presentation/utils/cart_utils.dart';
>>>>>>> e751dd7 ( product details screen change)
import '../../../shared/widgets/other/productpricetext.dart';
import '../../../shared/widgets/roundedContainer.dart';
import '../../../shared/widgets/roundedImage.dart';
import '../../../shared/widgets/two_side_rounded_button.dart';
import '../../domain/models/wish_items.dart';
import '../controller/wishlist_controller.dart';


/*class WishlistProductTile extends StatelessWidget {
  final WishItem wishlistProduct;

  const WishlistProductTile(this.wishlistProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    final WishListController wishlistController = Get.find<WishListController>();

    return GetBuilder<WishListController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colours.lightThemeWhiteColour,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Display Product Image
                  Image.network('${wishlistProduct.productImageUrl}',
                      height: 80, width: 80),
                  const Gap(10),
                  // Display Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(wishlistProduct.productName.toString(),
                            style: TextStyles.headingMedium4),
                        Text('\$${wishlistProduct.price}',
                            style: TextStyles.headingMedium4),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remove from Wishlist
                  TextButton(
                    onPressed: () {
                      controller.removeFromWishList(
                        wishUid: wishlistProduct.uid.toString(),
                      );
                    },
                    child: const Text('Remove'),
                  ),
                  // Add to Cart
                  TextButton(
                    onPressed: () {
                     // controller.addToWishList(productId: wishlistProduct.productUid);

                    },
                    child: const Text('ADD TO CART'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}*/


class WishlistProductTile extends StatelessWidget {
  const WishlistProductTile(this.wishlistProduct,{super.key,});

  final WishItem wishlistProduct;

  @override
  Widget build(BuildContext context) {
    final WishListController wishlistController = Get.find<WishListController>();
    final CartController cartController = Get.find<CartController>();
    var dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(16),
            color:dark ? Colours.drColor : Colours.wColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // thumbnail ,Wishlist,button,Discount Tag
            Expanded(
              flex: 1,
              child: RoundedContainer(
                height: 120,
                padding: const EdgeInsets.all(8),
                backgroundColor: dark ? Colours.drColor :Colours.wColor,
                child: Stack(
                  children: [
                    //--- Thumbnail image
                    RoundedImage(
                      isNetworkImage: true,
                      imageUrl: '${wishlistProduct.productImageUrl}',applyImageRadius: true,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //--- Sale Tag
                      /*  RoundedContainer(
                          radius: 8,
                          backgroundColor: Colours.primary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          child: Text(item.offer.toString(),style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.yellow),),
                        ),*/
                        // -- Favourite Icon Button
                        //   const CircularIcon(icon: Icons.favorite,color: Colors.red,),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            // --- details
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 172,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SizedBox(
                             width:  170,
                             child: ProductTitleText(title:wishlistProduct.productName.toString(),
                               maxLines: 1,smallSize: true,)),
                         IconButton(
<<<<<<< HEAD
                             onPressed: (){
                           wishlistController.removeFromWishList(
                             wishUid: wishlistProduct.uid.toString(),
                           );
=======
                             onPressed: () async{
                               final shouldDelete = await CartUtils.verifyDeletions(
                                 context,
                                 message: 'Are you sure you want to remove these items?',
                               );
                               if(shouldDelete){
                                 wishlistController.removeFromWishList(
                                   wishUid: wishlistProduct.uid.toString(),
                                 );
                               }

>>>>>>> e751dd7 ( product details screen change)
                         }, icon: const Icon(Icons.delete)),
                       ],
                     ),
                      const SizedBox(height: 16 /2,),
                     // BrandVerifiedIcon(title: item.brandName.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductPriceText(price: '${wishlistProduct.price}',),
                          /*Container(
                            decoration: BoxDecoration(
                              color: Colours.drColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(Sizes.cardRadiusMd),
                                bottomLeft: Radius.circular(Sizes.productImageRadius),

                              ),
                            ),
                            child: const SizedBox(
                                width: Sizes.iconLg * 1.2,
                                height: Sizes.iconLg * 1.2,
                                child: Center(child: Icon(Icons.add_circle_outline,color: Colours.wColor,))),
                          ),*/
                          Container(
                            width: 100,
                            alignment: Alignment.center,
                            color: Colors.white,

                            child: TwoSideRoundedButton(text: 'Add to Cart',fontSize: 11,
                                press: (){
                              cartController.addToCart(
                                  productUid: wishlistProduct.productUid!,
                                  imageUid: wishlistProduct.productImageUid!,
                                  sizeUid: wishlistProduct.productSizeUid!,
                                  colorUid: wishlistProduct.productColorUid!,
                                  quantity: cartController.quantity.value);

                              wishlistController.removeFromWishList(
                                wishUid: wishlistProduct.uid.toString(),
                              );

                            }),
                          ),
                        ],
                      )

                    ],
                  ),

                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

