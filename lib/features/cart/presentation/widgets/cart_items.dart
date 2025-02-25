

import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/shadows.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../shared/widgets/other/productpricetext.dart';
import '../../../shared/widgets/roundedContainer.dart';
import '../../../shared/widgets/roundedImage.dart';
import '../../../shared/widgets/two_side_rounded_button.dart';
import '../../domains/models/cart_Items.dart';
import '../controller/cart_controller.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key, required this.item});
  final CartsItems item;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
    CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {

    var dark = HelperFunctions.isDarkMode(context);
    return Card(
      elevation: 3,
      child: Container(
        width: HelperFunctions.screenWidth() * .1,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(16.0),
            color:dark ? Colours.drColor : Colours.wColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // thumbnail
                Row(
                  children: [
                    RoundedContainer(
                      height: 110,
                      padding:  const EdgeInsets.all(8.0),
                      backgroundColor: dark ? Colours.drColor :Colours.wColor,
                      child: Stack(
                        children: [
                          //--- Thumbnail image
                          RoundedImage(
                            width: 60,
                            height: 150,
                            isNetworkImage: true,
                            imageUrl:"${NetworkConstants.baseUrlOne}${widget.item.productImage}",applyImageRadius: true,fit: BoxFit.fill,),

                        ],
                      ),
                    ),
                  ],
                ),

                // --- details
                Row(
                  children: [
                    SizedBox(
                      width: 210,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductTitleText(title:widget.item.productName.toString(),smallSize: true,maxLines: 1,),
                            const SizedBox(height: 16.0 /2,),
                            //price, increase and decrease
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: PriceProductCountText(
                                  price: widget.item.price!.toStringAsFixed(0),
                                quantity: widget.item.quantity!,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,top: 15),
                                  child: Container(
                                    width: 20,
                                    alignment: Alignment.center,
                                    color: Colors.white,

                                    child: TwoSideRoundedButton(text: '-',fontSize: 11,
                                        press: (){
                                      setState(() {
                                        cartController.decrement(widget.item.productUid);
                                      });
                                      print('-');
                                    }),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 15),
                                  child: Text(widget.item.quantity.toString(),
                                    style: const TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,top: 15),
                                  child: Container(
                                    width: 20,
                                    alignment: Alignment.center,
                                    color: Colors.white,

                                    child: TwoSideRoundedButton(text: '+',fontSize: 11,
                                        press: (){
                                          setState(() {
                                            cartController.increment(widget.item.productUid);
                                          });
                                      print('+');
                                    }),
                                  ),
                                )
                              ],
                            )

                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ProductPriceText(
                        price: widget.item.price!.toStringAsFixed(0),),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  print(widget.item.productUid!.toString());
                  cartController.removeFromCart(
                      cartProductUid:widget.item.productUid!);
                },
                    icon: const Row(
                  children: [
                    Icon(Icons.delete_outline),
                    Text('Remove')
                  ],
                )),

              ],
            ),
          ],
        ),
      ),
    );
  }
}



