import 'dart:convert';


import 'package:e_comapp/core/extensions/string_extensions.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';
import '../../../../core/error/error_reponse.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../../core/utils/constants/network_constants.dart';

abstract class AuthRemoteDataSrc{

  const AuthRemoteDataSrc();

  Future<void> login({
    required String email,
    required String password,
});

  Future<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
});

 // Future<bool> verifyToken();
}
const REGISTER_ENDPOINT = '/registration';
const LOGIN_ENDPOINT = '/login';





class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc{

  const AuthRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<void> login({
    required String email,
    required String password}) async{
    try{
      final uri = Uri.parse('${NetworkConstants.baseUrl}$LOGIN_ENDPOINT');

      final response = await _client.post(
        uri,
        body: jsonEncode({
          'email': email,
          'password': password}),
        headers: NetworkConstants.headers,
      );

      final payload = jsonDecode(response.body) as DataMap;
      debugPrint(response.statusCode.toString());
      if(response.statusCode != 200){
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }

      await sl<CacheHelper>().cacheAccessToken(payload['access']);



      final tokenValue = payload['access'];
      await sl<CacheHelper>().cacheAccessToken(tokenValue);
     // await sl<CacheHelper>().resetSessionKey();
     // debugPrint("Login_sessionKey_remove:${sl<CacheHelper>().resetSessionKey().toString()}");
/*      final sessionKey = sl<CacheHelper>().getSession();
      debugPrint('Login_sessionKey:$sessionKey');
      // 🧠 Cart merge logic
      if (sessionKey != null) {
        final mergeUri = Uri.parse("${NetworkConstants.baseUrl}${NetworkConstants.cartListAddEndPoint}");
        final mergeResponse = await http.post(
          mergeUri,
          headers: sl<CacheHelper>().getAccessAllToken()?.toHeaders,
          body: jsonEncode({"X-Session-Key": sessionKey}),
        );
        debugPrint('Login_cartListGet Called');
        debugPrint('Login_cartListGet Called: ${mergeResponse.statusCode}');
        if (mergeResponse.statusCode != 200) {
          throw ServerException(
            message: "Cart merge failed",
            statusCode: mergeResponse.statusCode,
          );
        } else {
          debugPrint("✅ Cart merged successfully.");
          await sl<CacheHelper>().resetSessionKey();
        }
      }*/

    }on ServerException {
      rethrow;
    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
      
    }
  }

  @override
  Future<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,

  }) async{

    try{
      final uri = Uri.parse('${NetworkConstants.baseUrl}$REGISTER_ENDPOINT');

      final response = await _client.post(
        uri,
        body: jsonEncode({
        'first_name' : firstname,
        'last_name' : lastname,
        'email' : email,
        'phone' : phone,
        'password' : password,
        "confirm_password":confirmPassword,
      }),
        headers: NetworkConstants.headers,
      );
      if(response.statusCode != 200 && response.statusCode != 201 ){
        final playload = jsonDecode(response.body)as DataMap;
        final errorResponse = ErrorResponse.fromMap(playload);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode,);
      }
    }on ServerException{
      rethrow;
    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }

  }
}
