import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/checkout/domain/model/Checkoutmodel.dart';

import '../model/DeliveryAddress.dart';

abstract class CheckoutRepo{

  ResultFuture<CheckoutModel> checkoutData({
    required String cartUid,
    required DeliveryAddress deliveryAddress,
    String? notes});
}