
import 'package:e_comapp/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../../../shared/widgets/buttonWidget.dart';
import '../../../shared/widgets/other/productpricetext.dart';
import '../../../wishlist/presentation/widgets/bottomBar_shimmer.dart';
import '../../../wishlist/presentation/widgets/cart_shimmer.dart';
import '../widgets/cartListView.dart';
import '../widgets/empty_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const path = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool removingBulkProducts = false;
  final CartController cartController = Get.find<CartController>();
  int totalItems =0;

  Future<void> getCart() async {
    await cartController.fetchGetCartList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCart();
      cartController.QuantityItemUpdate();
    });
  }



  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (removingBulkProducts || cartController.isLoading.value) {

        return Scaffold(
          appBar: CustomAppBar(
            txtOnPressed: () {},
            showBackArrow: false,
            action: const [],
            text: 'My Cart(${cartController.cartList.length} Items)',
            centerTitle: true,
          ),

          bottomNavigationBar: BottomBarShimmer(),


          body: CartShimmer(),
        );
      } else if (cartController.cartList.isEmpty) {
        print("Empty:${cartController.cartList.length}");
        return BuildEmptyCartState();
      }else{
        return Scaffold(

          appBar: CustomAppBar(
            txtOnPressed: () {},
            showBackArrow: false,
            text: 'My Cart(${cartController.cartList.length} Items)',
            centerTitle: true,
            action: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.delete_forever_rounded))
            ],
          ),
          bottomNavigationBar: Card(
            color: Colors.blue.shade50,
            surfaceTintColor: Colors.green.shade50,
           // shadowColor: Colors.green.shade100,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green.shade50),
            ),
            elevation: 5,
            child: SizedBox(
              height: 110,
              width: HelperFunctions.screenWidth(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              const Text('Item:',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              Obx(
                                    ()=> Text( cartController.quantityTotal.value.toString(),
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                              )
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
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                  ProductPriceText(
                                    // price: "${cartController.totalPrices.value}",
                                    price: "\$${cartController.allPrices()}",
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
                  Gap(5),
                  RoundButtonWidget(
                    onPressed: () {
                      // Get.toNamed(OrderScreen.path);
                    },
                    title: 'Checkout',
                    wight: 200,
                    color: Colors.blue.shade300,
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
                  child: CartListView(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }
      });

    }
}








