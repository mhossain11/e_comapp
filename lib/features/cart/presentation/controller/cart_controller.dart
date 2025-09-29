import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:e_comapp/features/cart/domains/repo/cartlist_repo.dart';
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

  // Add Item to Cart

  increment(CartsItems item,productUid) async{
    quantity.value =1;

    var existingItem = cartList.firstWhereOrNull((element) => element.productUid == item.productUid);
    int index = cartList.indexWhere((item) => item.productUid == productUid);
    if (existingItem != null) {
      if (index != -1) {
         quantity.value = cartList[index].quantity++;
          quantity.value+=1;
        cartList[index].totalPrice = cartList[index].quantity * cartList[index].price;
      }
    await addToCart(
          productUid: item.productUid,
          imageUid: item.productImageUid,
          sizeUid: item.productSizeUid,
          colorUid: item.productColorUid,
          quantity: quantity.value);
      QuantityItemUpdate();

      quantity.value=1;
      quantity.value=0;
    }
    QuantityItemUpdate();
    allPrices();
    update();
  }

  decrement(CartsItems item,productUid) async{

    quantity.value =1;


    int index = cartList.indexWhere((item) => item.productUid == productUid);
    var existingItem = cartList.firstWhereOrNull((element) => element.productUid == item.productUid);
    //print(cartList[index].quantity);
    if (existingItem != null) {
      if (index != -1) {
        if (cartList[index].quantity > 1) {

          quantity.value =cartList[index].quantity--;
          quantity.value--;
          cartList[index].totalPrice = cartList[index].quantity * cartList[index].price;
        }
      }

      await addToCart(
          productUid: item.productUid,
          imageUid: item.productImageUid,
          sizeUid: item.productSizeUid,
          colorUid: item.productColorUid,
          quantity: quantity.value);

      quantity.value =1;

      quantity.value=0;

      print(cartList[index].quantity);

    }
    QuantityItemUpdate();
    allPrices();
    update();
}

void QuantityItemUpdate(){
  quantityTotal.value = cartList.fold(0, (sum, item) => sum + item.quantity);

  }





}