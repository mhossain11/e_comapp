
import 'dart:convert';

import 'package:e_comapp/core/app/cache/cache_helper.dart';
import 'package:e_comapp/core/error/error_reponse.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/core/utils/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../core/di/injection_container.main.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/models/wish_items.dart';
abstract class WishRemoteDataSrc{

  Future<List<WishItem>> getWishList();

  Future<void> addWishList({
    required String productId,
    required String imageId,
    required String sizeId,
    required String colorId,

});

  Future<void> removeWish({
    required String wishUid,
});

}

class WishRemoteDataSrcImpl implements WishRemoteDataSrc{
  WishRemoteDataSrcImpl(this._client);

  final http.Client _client;


  @override
  Future< List<WishItem> > getWishList() async{
    try{
<<<<<<< HEAD
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.wishList_Get}');
=======
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.wishListGet}');
>>>>>>> e751dd7 ( product details screen change)

      final response =await _client.get(
        uri,
        headers: sl<CacheHelper>().getAccessToken()?.toHeaders,
      );
        final payload = jsonDecode(response.body);
        await NetworkUtils.renewToken(response);


        if(response.statusCode != 200){
          payload as DataMap;
          final errorResponse = ErrorResponse.fromMap(payload);
          throw ServerException(
              message: errorResponse.errorMessage,
              statusCode: response.statusCode);
        }
       // payload as List<dynamic>;
      return (payload["items"] as List)
          .map(
            (wishlistProduct) => WishItem.fromJson(wishlistProduct),
      )
          .toList();

    }on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }


  @override
  Future<void> addWishList({
    required String productId,
  required String imageId,
    required String sizeId,
    required String colorId,
  }) async{
    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.wishListAddEndPoint}');

      final response =await _client.post(
        uri,
        headers: sl<CacheHelper>().getAccessToken()?.toHeaders,
        body: jsonEncode({
          'product_id':productId,
          'image_id':imageId,
          'size_id':sizeId,
          'color_id':colorId
        })
      );

    await  NetworkUtils.renewToken(response);

    if(response.statusCode != 200){
      final payload = jsonDecode(response.body) as DataMap;
      final errorResponse = ErrorResponse.fromMap(payload);
      throw ServerException(message: errorResponse.errorMessage, statusCode: response.statusCode);
    }
    }on ServerException{
      rethrow;
    } catch (e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);

    }

  }

  @override
  Future<void> removeWish({required String
  wishUid}) async{
    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.wishListRemoveEndPoint}');
      final response =await _client.delete(
        uri,
        headers: sl<CacheHelper>().getAccessToken()?.toHeaders,
        body: jsonEncode({'uid':wishUid})
      );
     await NetworkUtils.renewToken(response);
     if(response.statusCode != 200){
       final payload = jsonDecode(response.body)as DataMap;
       final errorResponse = ErrorResponse.fromMap(payload);
       throw ServerException(message: errorResponse.errorMessage, statusCode: response.statusCode);
     }
    }on ServerException{
      rethrow;
    }
    catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}