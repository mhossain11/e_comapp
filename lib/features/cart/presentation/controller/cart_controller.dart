import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:e_comapp/features/cart/domains/repo/cartlist_repo.dart';
import 'package:get/get.dart';

<<<<<<< HEAD
=======
import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';

>>>>>>> e751dd7 ( product details screen change)
class CartController extends GetxController {
  CartController(this. _cartListRepo);
  final CartListRepo _cartListRepo;

<<<<<<< HEAD



  var cartList =<CartsItems>[].obs;
=======
      @override
  void onInit() {
    super.onInit();
    fetchGetCartList();
    getSessionKey();
  }


  RxList<CartsItems> cartList =<CartsItems>[].obs;
>>>>>>> e751dd7 ( product details screen change)
  var totalPrices=0.0.obs;
  var isLoading = false.obs;
  var isAddingToCart = false.obs;                      // Adding to wishlist state
  var isRemovingFromCart = false.obs;
  var errorMessage = ''.obs;
<<<<<<< HEAD
  var quantity = 1.obs;
  var cartCount = 0.obs;


=======
  var quantity = 0.obs;
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

>>>>>>> e751dd7 ( product details screen change)
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
     // update();
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
     // update(); // Notify listeners
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
     // update(); // Notify listeners
    }
  }


 String allPrices(){

   double item = cartList.fold(0, (sum, item) => sum + item.totalPrice);
   totalPrices.value = item;
   print(item.toString());
   print(totalPrices.value.toString());
   return totalPrices.value.toString();
  }

  // Add Item to Cart

  increment(CartsItems item,productUid) async{
    print("Incr1:${quantity.value}");
<<<<<<< HEAD
    quantity.value =1;
=======
>>>>>>> e751dd7 ( product details screen change)
    var existingItem = cartList.firstWhereOrNull((element) => element.productUid == item.productUid);
    int index = cartList.indexWhere((item) => item.productUid == productUid);
    if (existingItem != null) {
      if (index != -1) {
        print("Incr:${cartList[index].quantity}");
<<<<<<< HEAD
         quantity.value = cartList[index].quantity++;
=======
          quantity.value+=1;
>>>>>>> e751dd7 ( product details screen change)
        cartList[index].totalPrice = cartList[index].quantity * cartList[index].price;
         print("Incr2:${quantity.value}");
      }
      print(quantity.value);
      //removeFromCart( cartProductUid: item.productUid);
      print(quantity.value);
    await addToCart(
          productUid: item.productUid,
          imageUid: item.productImageUid,
          sizeUid: item.productSizeUid,
          colorUid: item.productColorUid,
          quantity: quantity.value);
<<<<<<< HEAD
      quantity.value=1;
=======
      quantity.value=0;
>>>>>>> e751dd7 ( product details screen change)
      print(quantity.value);
    }

    allPrices();
    update();
  }

  decrement(CartsItems item,productUid) async{
<<<<<<< HEAD
    quantity.value =1;
=======
>>>>>>> e751dd7 ( product details screen change)
    int index = cartList.indexWhere((item) => item.productUid == productUid);
    var existingItem = cartList.firstWhereOrNull((element) => element.productUid == item.productUid);
    print(cartList[index].quantity);
    if (existingItem != null) {
      if (index != -1) {
        if (cartList[index].quantity > 1) {
<<<<<<< HEAD
          quantity.value =cartList[index].quantity--;
=======
          quantity.value--;
>>>>>>> e751dd7 ( product details screen change)
          cartList[index].totalPrice = cartList[index].quantity * cartList[index].price;
        }
      }
      print(cartList[index].quantity);
      print(cartList[index].totalPrice);
      await addToCart(
          productUid: item.productUid,
          imageUid: item.productImageUid,
          sizeUid: item.productSizeUid,
          colorUid: item.productColorUid,
          quantity: quantity.value);
      print(cartList[index].quantity);
<<<<<<< HEAD
      quantity.value =1;
=======
      quantity.value=0;
>>>>>>> e751dd7 ( product details screen change)
      print(cartList[index].quantity);
    }
    allPrices();
    update();

}


}