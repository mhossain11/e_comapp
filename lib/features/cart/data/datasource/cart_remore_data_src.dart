import 'dart:convert';

import 'package:e_comapp/core/app/cache/cache_helper.dart';
import 'package:e_comapp/core/error/error_reponse.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/core/utils/network_utils.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../../../../core/di/injection_container.main.dart';
abstract class CartRemoteDataSrc{

  Future<List<CartsItems>> getCart();



  Future<String> getSessionKey();

  
  Future<void> addToCart({
  required String productUid,
  required String imageUid,
  required String sizeUid,
  required String colorUid,
  required int quantity,
});

  Future<void> removeFromCart({
    required String cartProductUid});

}



class CartRemoteDataSrcImpl implements CartRemoteDataSrc {
  CartRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  @override
  Future<String> getSessionKey() async {
   /* final existingKey = sl<CacheHelper>().getSession();
    if (existingKey != null && existingKey.isNotEmpty) {
      return existingKey;
    }*/
    try {
      final uri = Uri.parse(
          '${NetworkConstants.baseUrlOne}${NetworkConstants.sessionKey}');

      final response = await _client.get(
        uri,
        headers: NetworkConstants.headers,

      ).timeout(const Duration(seconds: 60));
      final payload = jsonDecode(response.body);
      await NetworkUtils.renewToken(response);

      if (response.statusCode != 200) {
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      //await sl<CacheHelper>().cacheSessionToken(payload);
      return payload["session_key"] ?? "";
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<List<CartsItems>> getCart() async {
    await getSessionKey();
    try {
      final uri = Uri.parse(
          '${NetworkConstants.baseUrlOne}${NetworkConstants.cartListGet}');
      final response = await _client.get(
        uri,
        headers: sl<CacheHelper>().getAccessAllToken()?.toHeader,
      ).timeout(const Duration(seconds: 60));
      debugPrint('Hedder:${sl<CacheHelper>().getAccessAllToken()!.toHeader}');
      final payload = jsonDecode(response.body);
      await NetworkUtils.renewToken(response);
      //await sl<CacheHelper>().removeSessionKey();
      if (response.statusCode != 200) {
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }

      return (payload["items"] as List)
          .map(
            (cartProduct) => CartsItems.fromJson(cartProduct),
      )
          .toList();
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }


  @override
  Future<void> addToCart({
    required String productUid,
    required String imageUid,
    required String sizeUid,
    required String colorUid,
    required int quantity}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants
          .cartListAddEndPoint}');

      final response = await _client.post(
          uri,
          headers: sl<CacheHelper>()
              .getAccessAllToken()
              ?.toHeader,
          body: jsonEncode({
            'product_uid': productUid,
            'image_uid': imageUid,
            'size_uid': sizeUid,
            'color_uid': colorUid,
            'quantity': quantity
          })
      );
      await NetworkUtils.renewToken(response);

      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> removeFromCart({
    required String cartProductUid}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants
          .cartListRemoveEndPoint}$cartProductUid/');

      final response = await _client.delete(
        uri,
        headers: sl<CacheHelper>().getAccessAllToken()!.toHeaders,
      );
      await NetworkUtils.renewToken(response);

      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}