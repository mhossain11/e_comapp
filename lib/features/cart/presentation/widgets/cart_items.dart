

import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/shadows.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../product_details/presentations/widget/remove_bottomsheet.dart';
import '../../../shared/widgets/other/productpricetext.dart';
import '../../../shared/widgets/roundedContainer.dart';
import '../../../shared/widgets/roundedImage.dart';
import '../../../shared/widgets/two_side_rounded_button.dart';
import '../../domains/models/cart_Items.dart';
import '../controller/cart_controller.dart';
import '../utils/cart_utils.dart';

class CartItems extends StatefulWidget {
   CartItems({super.key, required this.item,});
  final CartsItems item;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    print('Item: ${widget.item.quantity.toString()}');
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
                // image
                RoundedContainer(
                  height: 100.h,
                  padding:  const EdgeInsets.all(8.0),
                  backgroundColor: dark ? Colours.drColor :Colours.wColor,
                  child: Stack(
                    children: [
                      //--- Thumbnail image
                      RoundedImage(
                        width: 60.w,
                        height: 150.h,
                        isNetworkImage: true,
                        imageUrl:"${NetworkConstants.baseUrlOne}${widget.item.productImage}",applyImageRadius: true,fit: BoxFit.fill,),

                    ],
                  ),
                ),

                // --- details
                Row(
                  children: [
                    SizedBox(
                      width: 210.w,
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
                                Flexible(
                                    child: PriceProductCountText(
                                      price: widget.item.price.toStringAsFixed(0),
                                      quantity: widget.item.quantity,
                                    )),
                                //-
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,top: 15),
                                  child: Container(
                                    width: 20.w,
                                    alignment: Alignment.center,
                                    color: Colors.white,

                                    child: TwoSideRoundedButton(
                                        text: '-',fontSize: 11,
                                        press: (){
                                          cartController.decrement(widget.item,widget.item.productUid);
                                          print('-');
                                        }),
                                  ),
                                ),


                                //Quantity
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 15),
                                  child: Text(widget.item.quantity.toString(),
                                    style: const TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                ),

                                //+
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,top: 15),
                                  child: Container(
                                    width: 20.w,
                                    alignment: Alignment.center,
                                    color: Colors.white,

                                    child: TwoSideRoundedButton(text: '+',fontSize: 11,
                                        press: (){
                                          cartController.increment(widget.item,widget.item.productUid);
                                          //  cartController.addToCarts(widget.item);

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
                   /* Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ProductPriceText(
                        price: widget.item.price.toStringAsFixed(0),),
                    ),*/
                  ],
                )
              ],
            ),
            //Delete
            //Login না হলে delete হয় না ।
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()async{
                  print(widget.item.productUid.toString());
                  print(widget.item.productImage.toString());
                  showRemoveFromCartSheet(
                    context,
                    productName: widget.item.productName,
                    productImage: 'https://ecommerce.liberalsoft.net${widget.item.productImage}',
                    price: widget.item.price,
                    oldPrice: widget.item.price,
                    onConfirm: () {
                      cartController.removeFromCart(
                          cartProductUid:widget.item.productUid);
                    },
                  );

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



