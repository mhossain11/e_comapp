
import 'dart:convert';

import 'package:e_comapp/core/app/cache/cache_helper.dart';
import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/core/utils/network_utils.dart';
import 'package:e_comapp/features/profile/domain/model/profilemodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/di/injection_container.main.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/typedefs.dart';
import 'package:http/http.dart'as http;

abstract class ProfileRemoteDataSrc {

  Future<ProfileModel> getProfile(String userId);
  Future<ProfileModel> updateProfile({
   required String userId,
    required DataMap updateData
});
}

const GET_PROFILE_ENDPOINT = '/profile/';
const UPDATE_USER_ENDPOINT = '/users';

class ProfileRemoteDataSrcImpl implements ProfileRemoteDataSrc{
  const ProfileRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<ProfileModel> getProfile(String userId) async{

    try{
    final  uri = Uri.parse('${NetworkConstants.baseUrl}$GET_PROFILE_ENDPOINT');

    final response =await _client.get(
      uri,
      headers: sl<CacheHelper>().getAccessToken()?.toHeaders,
    );

    final payload = jsonDecode(response.body) as DataMap;
    await NetworkUtils.renewToken(response);

    return ProfileModel.fromJson(payload);

    }catch(e){
      debugPrint(e.toString());
      //debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }


  }

  @override
  Future<ProfileModel> updateProfile({
    required String userId,
    required DataMap updateData}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

}