import 'dart:convert';

import 'package:e_comapp/core/app/cache/cache_helper.dart';
import 'package:e_comapp/core/error/error_reponse.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../../../../core/di/injection_container.main.dart';
import '../../../../core/utils/constants/network_constants.dart';

abstract class ProductRemoteDataSrc{

  Future<Products> getProducts(String productId);


  //Future<Products> getProductsReview(String productId);


}

const GET_PRODUCTS_ENDPOINT = '/products';

class ProductRemoteDataSrcImp implements ProductRemoteDataSrc{
  ProductRemoteDataSrcImp(this._client);

  final http.Client _client;

  @override
  Future<Products> getProducts(String productId) async{



    print('ProductID:$productId');

    try{
      final uri =Uri.http(NetworkConstants.authority,'${NetworkConstants.apiUrl}$GET_PRODUCTS_ENDPOINT/$productId/');
     // final uri =Uri.parse('${NetworkConstants.baseUrlOne}/$productId/');

      final response = await _client.get(
        uri,
      headers: NetworkConstants.headers,
      );

      final payload = jsonDecode(response.body) as DataMap;
      if(response.statusCode != 200){
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      print(payload.length);
      return Products.fromJson(payload);
    }on ServerException{
      rethrow;
    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }


}