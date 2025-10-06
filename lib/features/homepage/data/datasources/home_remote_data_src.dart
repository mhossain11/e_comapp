
import 'dart:convert';

import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/homepage/domain/model/searchmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/error_reponse.dart';
import '../../../../core/error/exceptions.dart';

abstract class HomeRemoteDataSrc {

  Future<List<SearchModel>> searchData(String search);
}


class HomeRemoteDataSrcImpl extends HomeRemoteDataSrc{

  HomeRemoteDataSrcImpl(this._client);
  final http.Client _client;
  @override
/*  Future<List<SearchModel>> searchData(String search) async{
   try{
     final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.search}');
      final response =await _client.post(
        uri,
      body: jsonEncode({
        'search':search,
      }),
      headers:NetworkConstants.headers);

      final payload = jsonDecode(response.body) as DataMap;

     if(response.statusCode != 200){
       final errorResponse = ErrorResponse.fromMap(payload);
       throw ServerException(
           message: errorResponse.errorMessage,
           statusCode: response.statusCode);
     }

     if(payload is List){
       final List<SearchModel> searchList =
       payload.map((item) => SearchModel.fromJson(item)).toList();
       return searchList;
     }

     return searchList;

     
   }on ServerException {
     rethrow;
   }catch(e,s){
     debugPrint(e.toString());
     debugPrintStack(stackTrace: s);
     throw ServerException(message: e.toString(), statusCode: 500);
   }
  }*/

  Future<List<SearchModel>> searchData(String search) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrlOne}${NetworkConstants.search}');
      final response = await _client.post(
        uri,
        body: jsonEncode({'search': search}),
        headers: NetworkConstants.headers,
      );

      // Decode response
      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        if (decoded is Map<String, dynamic>) {
          final errorResponse = ErrorResponse.fromMap(decoded);
          throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode,
          );
        } else {
          throw ServerException(
            message: 'Unexpected error format',
            statusCode: response.statusCode,
          );
        }
      }

      // ✅ Expecting List of products from server
      if (decoded is List) {
        return decoded
            .map((item) => SearchModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          message: 'Invalid response type: expected List but got ${decoded.runtimeType}',
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