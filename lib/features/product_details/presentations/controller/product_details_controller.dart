import 'package:e_comapp/features/product_details/domain/repo/product_repo.dart';
import 'package:get/get.dart';

import '../../../categories/domain/model/Products.dart';
import '../../domain/model/product_review_model.dart';

class ProductDetailsController extends GetxController{
  ProductDetailsController(this._repo);
  final ProductRepo _repo;

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var selectedPrice = ''.obs;
  var products = <Products>[].obs;
  var selectedProduct = Rxn<Products>();
  var reviewList = <ProductReviewModel>[].obs;




  Future<void> fetchProduct(String productId)async{
    try{
      isLoading.value = true;
      update();
      final result = await _repo.getProduct(productId);
      result.fold(
              (failure){
            errorMessage.value = failure.errorMessage;
          },
              (fetchedProducts){
            selectedProduct.value = fetchedProducts;
          }
      );

    }finally{
      isLoading.value = false;
      update();
    }
  }


}