import 'dart:convert';

import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/error/error_reponse.dart';
import '../../domain/model/CategoryModel.dart';
import 'package:http/http.dart'as http;

abstract class CategoryRemoteDataSrc {
  const CategoryRemoteDataSrc();

  Future<List<CategoryModel>> getCategory();
}

const getCategoryEndpoint = '/categories';

class CategoryRemoteDataSrcImpl implements CategoryRemoteDataSrc{
  CategoryRemoteDataSrcImpl(this._client);

  final http.Client _client;
  @override
  Future<List<CategoryModel>> getCategory() async{

    try{
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}$getCategoryEndpoint');
      final response =await _client.get(
          uri,
        headers: NetworkConstants.headers,
        //headers: sl<CacheHelper>().getAccessToken()?.toHeaders,
      );

      final payload = jsonDecode(response.body);

      if(response.statusCode != 200){
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      payload as List<dynamic>;
      return payload.cast<DataMap>().map((category)=> CategoryModel.fromJson(category)).toList();

    }on ServerException {
      rethrow;

    }catch (e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

}