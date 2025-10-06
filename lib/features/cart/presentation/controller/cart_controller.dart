import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:e_comapp/features/cart/domains/repo/cartlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';


class CartController extends GetxController {
  CartController(this. _cartListRepo);
  final CartListRepo _cartListRepo;

  //var cartList =<CartsItems>[].obs;

      @override
  void onInit() {
    super.onInit();
    fetchGetCartList();
    getSessionKey();
  }


  RxList<CartsItems> cartList =<CartsItems>[].obs;

  var totalPrices=0.0.obs;
  var isLoading = false.obs;
  var isAddingToCart = false.obs;                      // Adding to wishlist state
  var isRemovingFromCart = false.obs;
  var errorMessage = ''.obs;

  //var quantity = 1.obs;
  //var cartCount = 0.obs;



  var quantity = 0.obs;
  var quantityTotal = 0.obs;
  var cartCount = 0.obs;


  Future<String>getSessionKey() async{
    try{
      isLoading.value =true;
      update();
      final result = await _cartListRepo.getSessionKey();
      String? sessionKey;
      result.fold(
              (failure){
            errorMessage.value = failure.errorMessage;
          },
              (fetchedData) {
                sessionKey = fetchedData;
                sl<CacheHelper>().cacheSessionToken(sessionKey!);
          }

      );
      return sessionKey ?? '';
    }finally{
      isLoading.value = false;
      // update();
    }
  }


  Future<void>fetchGetCartList() async{

    try{
      isLoading.value =true;
      final result = await _cartListRepo.getCartList();
      result.fold(
              (failure){
            errorMessage.value = failure.errorMessage;
          },
              (fetchedData){
            cartList.assignAll(fetchedData);
            QuantityItemUpdate();
            allPrices();
              }

      );
    }finally{
      isLoading.value = false;
    }

  }


  Future<void> addToCart({
  required String productUid,
  required String imageUid,
  required String sizeUid,
  required String colorUid,
  required int quantity,
  }) async {
    try {
      isAddingToCart.value = true;
      final result = await _cartListRepo.addCartList(
        productUid: productUid,
        imageUid: imageUid,
        sizeUid: sizeUid,
        colorUid: colorUid,
        quantity: quantity);
      result.fold(
            (failure) => errorMessage.value = failure.errorMessage,
            (_) {
          // Successfully added to cart, update cart details
          fetchGetCartList();
          QuantityItemUpdate();
          Get.snackbar('Success', 'Product added to cart');

        },
      );
    } finally {
      isAddingToCart.value = false;
    }
  }

  Future<void> cartUpdate({
    required String cartProductUid,
    required int quantity,}) async{
    try{
      isAddingToCart.value = true;
      final result = await _cartListRepo.updateCartList(
          cartProductUid: cartProductUid,
          quantity: quantity);

      result.fold(
              (failure){
                errorMessage.value = failure.errorMessage;
      }, (fetchedData){
        fetchGetCartList();
        QuantityItemUpdate();
        //Get.snackbar('Success', 'Product added to cart');
      });
    }catch(e){}
  }

  Future<void> removeFromCart({
    required String cartProductUid,
  }) async {
    try {
      isRemovingFromCart.value = true;
      final result = await _cartListRepo.removeFromCart(
          cartProductUid: cartProductUid);
      result.fold(
            (failure) {
              errorMessage.value = failure.errorMessage;
            },
            (_) {
              // local list form remove
              cartList.removeWhere((item)=> item.productUid == cartProductUid);
              //fetchGetCartList();
              QuantityItemUpdate();
             // Get.snackbar('Success', 'Product removed from cart');
        },
      );
    } finally {
      isRemovingFromCart.value = false;
    }
  }


 String allPrices(){
   double item = cartList.fold(0, (sum, item) => sum + item.totalPrice);
   totalPrices.value = item;
   QuantityItemUpdate();
   return totalPrices.value.toString();
  }


//-------------------------X
  void increment(CartsItems item, String productUid) async {
    int index = cartList.indexWhere((element) =>
    element.productUid == item.productUid &&
        element.productSizeUid == item.productSizeUid &&
        element.productColorUid == item.productColorUid
    );
    print('+index_print-0:$index');//এখানে আমরা চেক করছি যে cartList-এ এই product আছে কি না।
    if (index == -1) return; //যদি না থাকে (index == -1) → function exit।

    // Save old quantity in case of error
    int oldQuantity = cartList[index].quantity; //কারণ server sync fail হলে আমরা quantity আগের value-এ revert করব।
    print('Old_Print-1 ${cartList[index].quantity}');
    // Local update
    cartList[index].quantity += 1; //quantity locally +1 করা হয়েছে।
    cartList[index].totalPrice = cartList[index].quantity * cartList[index].price; //totalPrice হিসাব করা হয়েছে quantity * price।
    QuantityItemUpdate(); //QuantityItemUpdate() → সব relevant reactive value update করে।
    allPrices(); //allPrices() → cart-এর total price update করে।
    //before remove
   // _cartListRepo.removeFromCart(cartProductUid: cartList[index].productUid);
    //after add Server sync //Cart API call করা হয়েছে নতুন quantity সহ। এটি async operation।
    final result = await _cartListRepo.updateCartList(
      cartProductUid: item.productUid,
      quantity: cartList[index].quantity,
    );
    print('New_Print-1 ${cartList[index].quantity}');

    result.fold(
          (failure) {
            /*
            Error Case:
            যদি server কোনো error return করে → আগের quantity এবং totalPrice restore করা হবে।
            UI update হবে আগের state-এ।
            Snackbar দেখাবে error message।

            Success Case:
            কিছু extra করার দরকার নেই। UI আগেই update হয়ে গেছে।*/
        // Revert on error
        cartList[index].quantity = oldQuantity;
        cartList[index].totalPrice = oldQuantity * cartList[index].price;
        QuantityItemUpdate();
        allPrices();
        Get.snackbar('Error', failure.errorMessage,
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      },
          (_) {
        // Success: nothing extra needed
      },
    );
  }

  void decrement(CartsItems item, String productUid) async {
    int index = cartList.indexWhere((element) =>
    element.productUid == item.productUid &&
        element.productSizeUid == item.productSizeUid &&
        element.productColorUid == item.productColorUid
    );
    debugPrint('-index_print-0:$index');
    if (index == -1 || cartList[index].quantity <= 1) return;

    int oldQuantity = cartList[index].quantity;
      print('print-1:${cartList[index].quantity}');
    // Local update
    cartList[index].quantity -= 1;
    cartList[index].totalPrice = cartList[index].quantity * cartList[index].price;
    QuantityItemUpdate();
    allPrices();
    print('print-2${cartList[index].quantity}');

    //before remove
    //_cartListRepo.removeFromCart(cartProductUid: cartList[index].productUid);
    //after add Server sync
    final result = await _cartListRepo.updateCartList(
      cartProductUid: item.productUid,
      quantity: cartList[index].quantity,
    );

    result.fold(
          (failure) {
        // Revert on error
        cartList[index].quantity = oldQuantity;
        cartList[index].totalPrice = oldQuantity * cartList[index].price;
        QuantityItemUpdate();
        allPrices();
        Get.snackbar('Error', failure.errorMessage,
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      },
          (_) {
        // Success
      },
    );
  }




void QuantityItemUpdate(){
  quantityTotal.value = cartList.fold(0, (sum, item) => sum + item.quantity);

  }





}