<<<<<<< HEAD
=======
import 'dart:async';
>>>>>>> e751dd7 ( product details screen change)
import 'dart:convert';

import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/error/error_reponse.dart';
import '../../domain/model/CategoryModel.dart';
import 'package:http/http.dart'as http;
<<<<<<< HEAD
=======
import '../../domain/model/Slider_model.dart';
import '../../domain/model/specialCategoryProduct_model.dart';
import '../../domain/model/special_categories_model/special_categories_Uid_model.dart';
>>>>>>> e751dd7 ( product details screen change)

abstract class CategoryRemoteDataSrc {
  const CategoryRemoteDataSrc();

<<<<<<< HEAD
  Future<List<CategoryModel>> getCategory();
=======
  Future<List<SliderModel>> getSlider();
  Future<List<SliderModel>> getBanner();
  Future<List<ProductCategoriesModel>> getCategory();
  Future<List<SpecialCategoryProductModel>> getSpecialCategories();
  Future<SpecialCategoriesUidModel> getProducts(String productId);
>>>>>>> e751dd7 ( product details screen change)
}

const getCategoryEndpoint = '/categories/';

class CategoryRemoteDataSrcImpl implements CategoryRemoteDataSrc{
  CategoryRemoteDataSrcImpl(this._client);

  final http.Client _client;
<<<<<<< HEAD
  @override
  Future<List<CategoryModel>> getCategory() async{

    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.apiUrl}$getCategoryEndpoint');
      final response =await _client.get(
          uri,
        headers: NetworkConstants.headers,
        //headers: sl<CacheHelper>().getAccessToken()?.toHeaders,
      );

=======

  //Slider
  @override
  Future<List<SliderModel>> getSlider() async{

    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.sliders}');
      final response =await _client.get(
        uri,
        headers: NetworkConstants.headers,
      );
>>>>>>> e751dd7 ( product details screen change)
      final payload = jsonDecode(response.body);

      if(response.statusCode != 200){
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      payload as List<dynamic>;
<<<<<<< HEAD
      return payload.cast<DataMap>().map((category)=> CategoryModel.fromJson(category)).toList();
=======
      return payload.cast<DataMap>().map((slider)=> SliderModel.fromJson(slider)).toList();

    }on ServerException {
      rethrow;

    }catch (e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
  //Banner
  @override
  Future<List<SliderModel>> getBanner() async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.banners}');
      debugPrint('Requesting URL: $uri');

      final response = await _client
          .get(uri, headers: NetworkConstants.headers)
          .timeout(const Duration(seconds: 10));

      debugPrint('Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode != 200) {
        if (response.body.isNotEmpty) {
          final Map<String, dynamic> payload = jsonDecode(response.body);
          final errorResponse = ErrorResponse.fromMap(payload);
          throw ServerException(
              message: errorResponse.errorMessage,
              statusCode: response.statusCode);
        } else {
          throw ServerException(
              message: 'No response from server',
              statusCode: response.statusCode);
        }
      }

      final List<dynamic> payload = jsonDecode(response.body);
      return payload
          .cast<Map<String, dynamic>>()
          .map((banner) => SliderModel.fromJson(banner))
          .toList();

    } on ServerException {
      rethrow;
    } on TimeoutException{
      throw const ServerException(message: "Request timed out", statusCode: 408);
    }catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }



  //Category
  @override
  Future<List<ProductCategoriesModel>> getCategory() async{

    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.apiUrl}$getCategoryEndpoint');
      final response =await _client.get(
          uri,
        headers: NetworkConstants.headers,
      );
      final payload = jsonDecode(response.body);

      if(response.statusCode != 200){
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      payload as List<dynamic>;
      return payload.cast<DataMap>().map((category)=> ProductCategoriesModel.fromJson(category)).toList();
>>>>>>> e751dd7 ( product details screen change)

    }on ServerException {
      rethrow;

    }catch (e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

<<<<<<< HEAD
=======
  //SpecialCategories
  @override
  Future<List<SpecialCategoryProductModel>> getSpecialCategories() async{
    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.specialCategoriesAllEndPoint}');
      final response =await _client.get(
        uri,
        headers: NetworkConstants.headers,
      );
      final payload = jsonDecode(response.body);
     // final uid = payload['uid'];

      if(response.statusCode != 200){
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      payload as List<dynamic>;
     return payload.cast<DataMap>().map((category)=> SpecialCategoryProductModel.fromJson(category)).toList();

    }on ServerException {
      rethrow;

    }catch (e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

//Products
  @override
  Future<SpecialCategoriesUidModel> getProducts(String productId) async{
    try{
      final uri =Uri.http(NetworkConstants.authority,'${NetworkConstants.specialCategoriesEndPoint}/$productId');

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
      return SpecialCategoriesUidModel.fromJson(payload);
    }on ServerException{
      rethrow;
    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

>>>>>>> e751dd7 ( product details screen change)
}