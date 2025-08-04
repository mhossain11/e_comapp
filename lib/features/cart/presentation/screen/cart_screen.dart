/*

import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../../../shared/widgets/buttonWidget.dart';
import '../../../shared/widgets/empty_data.dart';
import '../../../shared/widgets/other/productpricetext.dart';
import '../widgets/cartListView.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const path = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool removingBulkProducts = false;
  CartController cartController = Get.find<CartController>();


  Future<void> getCart() async{
   await cartController.fetchGetCartList();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      getCart();
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (controller){

          if(removingBulkProducts || cartController.isLoading.value){

            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colours.lightThemePrimaryColour,
                ),
              ),
            );
          }else if(controller.cartList.isEmpty){
            return Scaffold(
              appBar: AppBar(
                title: const Text('My Cart'),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(Media.AnimetEmptyCart, repeat: true),
                      const Gap(5),
                      Text(
                        'Oh! So empty',
                        style: TextStyles.headingSemiBold.grey,
                      ),
                    ],
                  ),
                ),
              ),

            );
          }
          return Scaffold(
            appBar: CustomAppBar(
              txtOnPressed: () {},
              showBackArrow: false,
              action: const [],
              text: 'My Cart(${0} Items)',
              centerTitle: true,
            ),
            bottomNavigationBar: Card(
              color: Colors.green.shade50,
              surfaceTintColor: Colors.green.shade50,
              shadowColor: Colors.green.shade100,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green.shade50,
                  )),
              elevation: 5,
              child: SizedBox(
                height: 50,
                width: HelperFunctions.screenWidth(),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            const Text('Item:',
                                style: TextStyle(
                                    fontSize: 18.0,fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            Text(controller.cartList.length.toString(),
                                style: const TextStyle(
                                    fontSize: 18.0,fontWeight: FontWeight.bold,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 6.0, right: 8, top: 3, bottom: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text('Total:',
                                    style: TextStyle(
                                        fontSize: 16.0,fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                                 ProductPriceText(
                                  price:controller.total_Prices.value.toString(),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('You Save ',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey)),
                                Text('\$300',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: HelperFunctions.screenWidth(),
                    child: CartListView(
                      item: controller.cartList,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: RoundButtonWidget(
                        onPressed: () {
                         // Get.toNamed(OrderScreen.path);
                        },
                        title: 'Checkout',
                        wight: 200,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }
        );
  }
}
*/


//obx

import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../../../shared/widgets/buttonWidget.dart';
import '../../../shared/widgets/other/productpricetext.dart';
import '../widgets/cartListView.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const path = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool removingBulkProducts = false;
  final CartController cartController = Get.find<CartController>();

  Future<void> getCart() async {
    await cartController.fetchGetCartList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCart();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (removingBulkProducts || cartController.isLoading.value) {
        /*return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colours.lightThemePrimaryColour,
            ),
          ),
        );*/
        return Scaffold(
          appBar: CustomAppBar(
            txtOnPressed: () {},
            showBackArrow: false,
            action: const [],
            text: 'My Cart(${cartController.cartList.length} Items)',
            centerTitle: true,
          ),
          bottomNavigationBar: Card(
            color: Colors.green.shade50,
            surfaceTintColor: Colors.green.shade50,
            shadowColor: Colors.green.shade100,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green.shade50),
            ),
            elevation: 5,
            child: SizedBox(
              height: 50,
              width: HelperFunctions.screenWidth(),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          const Text('Item:',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          Text(cartController.cartList.length.toString(),
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 6.0, right: 8, top: 3, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Total:',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              ProductPriceText(
                                price: "\$${cartController.totalPrices.value}",
                               // price: "\$${cartController.allPrices()}",
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('You Save ',
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.grey)),
                              Text('\$300',
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.grey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  width: HelperFunctions.screenWidth(),
                  child: CartListView(
                    item: cartController.cartList,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RoundButtonWidget(
                    onPressed: () {
                      // Get.toNamed(OrderScreen.path);
                    },
                    title: 'Checkout',
                    wight: 200,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      } else if (cartController.cartList.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
<<<<<<< HEAD
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(Media.AnimetEmptyCart, repeat: true),
                  const Gap(5),
                  Text(
                    'Oh! So empty',
                    style: TextStyles.headingSemiBold.grey,
                  ),
                ],
=======
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(Media.AnimetEmptyCart, repeat: true),
                    const Gap(5),
                    Text(
                      'Oh! So empty',
                      style: TextStyles.headingSemiBold.grey,
                    ),
                  ],
                ),
>>>>>>> e751dd7 ( product details screen change)
              ),
            ),
          ),
        );
      }
<<<<<<< HEAD
      print("Price: ${cartController.totalPrices.value.toString()}");
=======

>>>>>>> e751dd7 ( product details screen change)
      return Scaffold(
        appBar: CustomAppBar(
          txtOnPressed: () {},
          showBackArrow: false,
          text: 'My Cart(${cartController.cartList.length} Items)',
          centerTitle: true,
        ),
        bottomNavigationBar: Card(
          color: Colors.green.shade50,
          surfaceTintColor: Colors.green.shade50,
          shadowColor: Colors.green.shade100,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green.shade50),
          ),
          elevation: 5,
          child: SizedBox(
            height: 50,
            width: HelperFunctions.screenWidth(),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        const Text('Item:',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                        Text(cartController.allPrices(),
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 8, top: 3, bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('Total:',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            ProductPriceText(
                              price: "\$${cartController.totalPrices.value}",
                              // price: "\$${cartController.allPrices()}",
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('You Save ',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey)),
                            Text('\$300',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                width: HelperFunctions.screenWidth(),
                child: CartListView(
                  item: cartController.cartList,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RoundButtonWidget(
                  onPressed: () {
                    // Get.toNamed(OrderScreen.path);
                  },
                  title: 'Checkout',
                  wight: 200,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

    });
  }
}

