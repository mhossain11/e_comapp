

import 'package:e_comapp/features/checkout/domain/repos/checkout_repo.dart';
import 'package:get/get.dart';

import '../../domain/model/Checkoutmodel.dart';
import '../../domain/model/DeliveryAddress.dart';

class CheckOutController extends GetxController{
CheckOutController(this._checkoutRepo);

  @override
  void onInit() {
    super.onInit();
  }
final CheckoutRepo _checkoutRepo;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
var checkoutList = <CheckoutModel>[].obs;

  Future<CheckoutModel> checkoutData({
    required String cartUid,
    required DeliveryAddress deliveryAddress,
    String? notes}) async{

    try {
      isLoading.value = true;
      final result = await _checkoutRepo.checkoutData(
          cartUid: cartUid,
          deliveryAddress: deliveryAddress);
      result.fold(
            (failure) => errorMessage.value = failure.errorMessage,
            (element) {
              checkoutList.add(element);
        },

      );
      return checkoutList.first;
    } finally {
     isLoading.value = true;
    }


}



}