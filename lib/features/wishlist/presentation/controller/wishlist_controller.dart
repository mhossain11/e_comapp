
import 'package:e_comapp/features/wishlist/domain/repos/wishlist_repo.dart';
import 'package:get/get.dart';

import '../../../../core/error/failures.dart';

import '../../domain/models/wish_items.dart';

class WishListController extends GetxController{
    final WishListRepo _wishListRepo;
    WishListController(this._wishListRepo);



  // var  wishListProduct =Rxn<WishListModel>();
   var wishList =<WishItem>[].obs;
   var isLoading = false.obs;
   var isAdding = false.obs;                      // Adding to wishlist state
   var isRemoving = false.obs;
   var errorMessage = ''.obs;


   Future<void>fetchGetWishList() async{

      try{
         isLoading.value =true;
         final result = await _wishListRepo.getWishlist();
         result.fold(
             (failure){
                errorMessage.value = _mapFailureToMessage(failure);
             },
             (fetchedData){
                wishList.value = fetchedData;
             }

         );
      }finally{
         isLoading.value = false;
         update();
      }

   }


   Future<void> addToWishList({required String productId,
     required String imageId,
     required String sizeId,
     required String colorId,
   })async{
      try{
         isLoading.value = true;
         final result =await _wishListRepo.addWishList(
             productId: productId,imageId: imageId,sizeId: sizeId,colorId: colorId);
         result.fold(
                (failure){
                   errorMessage.value = _mapFailureToMessage(failure);
                },
             (_){
                   Get.snackbar('Success', 'Product added to wishlist');
                   fetchGetWishList();
             }
         );
      }finally{
         isLoading.value = false;
         update();
      }
   }


   Future<void>removeFromWishList({required String wishUid})async{
      try{
         isRemoving.value = true;
         final result =await _wishListRepo.removeWish(wishUid: wishUid);
         update();
         result.fold(
             (failure){
                errorMessage.value = _mapFailureToMessage(failure);
             },
             (_){
                fetchGetWishList();
                Get.snackbar('Success', 'Product removed from wishlist');
             }
         );
      }finally{
         isRemoving.value = false;
         update();
      }
   }





    /// Helper method to map Failure to error messages
    String _mapFailureToMessage(Failure failure) {
       switch (failure.runtimeType) {
          case ServerFailure:
             return 'Server error occurred: ${failure.message}';
          default:
             return 'An unexpected error occurred';
       }
    }

}