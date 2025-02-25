import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:e_comapp/features/cart/domains/repo/cartlist_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartController(this. _cartListRepo);
  final CartListRepo _cartListRepo;


  var cartList =<CartsItems>[].obs;
  var total_Prices=0.obs;
  var isLoading = false.obs;
  var isAddingToCart = false.obs;                      // Adding to wishlist state
  var isRemovingFromCart = false.obs;
  var errorMessage = ''.obs;
  var quantity = 1.obs;
  var cartCount = 0.obs;


  Future<void>fetchGetCartList() async{

    try{
      isLoading.value =true;
      update();
      final result = await _cartListRepo.getCartList();
      result.fold(
              (failure){
            errorMessage.value = failure.errorMessage;
          },
              (fetchedData){
            cartList.assignAll(fetchedData);
          }

      );
    }finally{
      isLoading.value = false;
      update();
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
          Get.snackbar('Success', 'Product added to cart');

        },
      );
    } finally {
      isAddingToCart.value = false;
      update(); // Notify listeners
    }
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
          // Successfully removed from cart, update cart details
              fetchGetCartList();
              Get.snackbar('Success', 'Product removed from cart');
        },
      );
    } finally {
      isRemovingFromCart.value = false;
      update(); // Notify listeners
    }
  }


/*  String allPrices(){
    CartsItems item=  cartList.firstWhere((item)=> item.productUid == productId);
    total_Prices.value = total_Prices.value +  item.totalPrice!.toInt();
    return total_Prices.value.toString();

  }*/

  increment(productUid) async{
    CartsItems item = cartList.firstWhere((item) => item.productUid == productUid );
   quantity.value +=1;
    await addToCart(
        productUid: productUid,
        imageUid: item.productImageUid!,
        sizeUid: item.productSizeUid!,
        colorUid: item.productColorUid!,
        quantity: quantity.value);
   // fetchGetCartList();
    print('$productUid');
    print(item.productImageUid!);
    print(item.productSizeUid!);
    print(item.productColorUid!);
    print(quantity.value);
    update();
  }

  decrement(productUid) async{
     CartsItems item = cartList.firstWhere((item) => item.productUid == productUid);
    if (quantity > 1) {
      quantity.value--;
      await addToCart(
          productUid: productUid,
          imageUid: item.productImageUid!,
          sizeUid: item.productSizeUid!,
          colorUid: item.productColorUid!,
          quantity: quantity.value);
     // fetchGetCartList();
      print('$productUid');
      print(item.productImageUid!);
      print(item.productSizeUid!);
      print(item.productColorUid!);
      print(quantity.value);
      update();
    }
}


}