
import 'package:e_comapp/core/utils/typedefs.dart';
import '../models/wish_items.dart';

abstract class WishListRepo{

 ResultFuture<List<WishItem>> getWishlist();

 ResultFuture<void> addWishList({
    required String productId,
   required String imageId,
   required String sizeId,
   required String colorId,

  });

 ResultFuture<void> removeWish({
    required String wishUid,
  });
}