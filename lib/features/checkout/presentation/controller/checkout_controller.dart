import 'package:e_comapp/features/checkout/domain/repos/checkout_repo.dart';
import 'package:get/get.dart';

import '../../domain/model/Checkoutmodel.dart';
import '../../domain/model/DeliveryAddress.dart';

class CheckOutController extends GetxController {
  CheckOutController(this._checkoutRepo);

  @override
  void onInit() {
    super.onInit();
  }

  final CheckoutRepo _checkoutRepo;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var checkoutList = <CheckoutModel>[].obs;

  Future<CheckoutModel?> checkoutData({
    required String cartUid,
    required DeliveryAddress deliveryAddress,
    String? notes,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _checkoutRepo.checkoutData(
        cartUid: cartUid,
        deliveryAddress: deliveryAddress,
        notes: notes,
      ); // ✅ result is Either<Failure, CheckoutModel>

      CheckoutModel? model;

      result.fold(
            (failure) {
          errorMessage.value = failure.errorMessage;
        },
            (checkoutModel) {
          checkoutList.add(checkoutModel);
          model = checkoutModel;
          print("CheckOut: ${checkoutModel.message}");
          print("CheckOut: ${checkoutModel.order?.uid}");
        },
      );

      return model; // null if failure, CheckoutModel if success
    } catch (e) {
      errorMessage.value = e.toString();
      return null;
    } finally {
      isLoading.value = false;
    }
  }


}


