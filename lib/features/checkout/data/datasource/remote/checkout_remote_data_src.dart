import 'dart:convert';

import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/app/cache/cache_helper.dart';
import '../../../../../core/di/injection_container.main.dart';
import '../../../../../core/error/error_reponse.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/constants/network_constants.dart';
import '../../../../../core/utils/typedefs.dart';
import '../../../domain/model/Checkoutmodel.dart';
import '../../../domain/model/DeliveryAddress.dart';

abstract class CheckoutRemoteDataSrc{

  Future<CheckoutModel> checkOutData({
    required String cartUid,
    required DeliveryAddress deliveryAddress,
    String? notes
});
}


class CheckoutRemoteDataSrcImpl implements CheckoutRemoteDataSrc {
  CheckoutRemoteDataSrcImpl(this._client);
  final http.Client _client;


  @override
  Future<CheckoutModel> checkOutData({
    required String cartUid,
    required DeliveryAddress deliveryAddress,
    String? notes,
  }) async {

   try{

     final uri = Uri.parse(
         '${NetworkConstants.baseUrlOne}${NetworkConstants.checkout_post}');

     final response = await _client.post(
         uri,
         body: jsonEncode({
           'cart_uid': cartUid,
           'delivery_address': deliveryAddress.toJson(),
           'notes': notes ?? '',
         }),
         headers: sl<CacheHelper>().getAccessAllToken()!.toHeaders);


     final payload = jsonDecode(response.body);
     if (response.statusCode != 200 && response.statusCode != 201) {
       final errorResponse = ErrorResponse.fromMap(payload as DataMap);
       throw ServerException(
         message: errorResponse.errorMessage,
         statusCode: response.statusCode,
       );
     }
     return CheckoutModel.fromJson(payload);


   } on ServerException {
     rethrow;
   } catch (e, s) {
     debugPrint(e.toString());
     debugPrintStack(stackTrace: s);
     throw ServerException(message: e.toString(), statusCode: 500);
   }




  }

}