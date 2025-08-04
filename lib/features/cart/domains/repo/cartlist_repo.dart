
import 'package:e_comapp/core/utils/typedefs.dart';
import '../models/cart_Items.dart';

abstract class CartListRepo{
<<<<<<< HEAD
=======
  ResultFuture<String> getSessionKey();
>>>>>>> e751dd7 ( product details screen change)

 ResultFuture<List<CartsItems>> getCartList();

 ResultFuture<void> addCartList({
   required String productUid,
   required String imageUid,
   required String sizeUid,
   required String colorUid,
   required int quantity,

  });

 ResultFuture<void> removeFromCart({
    required String cartProductUid,
  });
}