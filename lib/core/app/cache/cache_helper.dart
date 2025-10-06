import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../router/app_router.dart';

class CacheHelper {
  const CacheHelper(this._prefs);

  final SharedPreferences _prefs;
  static const _accessTokenKey = 'user-access-token';
  static const _accessSessionKey = 'user-session-key';
  static const _userIdKey = 'user-id';
  static const _firstTimerKey = 'is-user-first-timer';

  Future<bool> cacheAccessToken(String token) async {
    try {
      final result = await _prefs.setString(_accessTokenKey, token);
      return result;
    } catch (_) {
      return false;
    }
  }
  Future<bool> cacheSessionToken(String token) async {
    try {
      final result = await _prefs.setString(_accessSessionKey, token);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheUserId(String userId) async {
    try {
      final result = await _prefs.setString(_userIdKey, userId);
      return result;
    } catch (_) {
      return false;
    }
  }
  Future<void> setData(String key, dynamic value)async{
    await _prefs.setString(key, value);

  }
  Future<String?> getData(String key)async{
    return _prefs.getString(key);
  }

  Future<void> cacheFirstTimer() async {
    await _prefs.setBool(_firstTimerKey, false);
  }

  bool getFirstTimer() {
    final isFirstTimer = _prefs.getBool(_firstTimerKey);

    return isFirstTimer ?? true;
  }
  String? getToken() {
    final accessToken = _prefs.getString(_accessTokenKey);

    if (accessToken != null ) {
      print(accessToken);
      debugPrint('getToken: access Token exists');
    } else {
      debugPrint('getToken: access does not exist');
    }
    return accessToken;
  }

  String? getSession() {
    final accessSessionKen = _prefs.getString(_accessSessionKey);

    if (accessSessionKen != null ) {
      print(accessSessionKen);
      debugPrint('getSessionToken: access Token exists');
    } else {
      debugPrint('getSessionToken: access does not exist');
    }
    return accessSessionKen;
  }


  String? getAccessToken() {
    final accessToken = _prefs.getString(_accessTokenKey);
    if (accessToken != null ) {
      print('getAccessToken: $accessToken');
      debugPrint('getSessionToken: access Token exists');
      debugPrint("accessToken1:${accessToken.toString()}");
    }else{
      debugPrint('getSessionToken: access does not exist');
      debugPrint("accessToken2:${accessToken.toString()}");

    }
    print(accessToken);

    return accessToken;
  }
  String? getAccessAllToken() {
    final accessToken = _prefs.getString(_accessTokenKey);
    final accessSessionKey = _prefs.getString(_accessSessionKey);
    if (accessToken != null ) {
      print(accessToken);
      debugPrint('getSessionToken: access Token exists');

    } else if(accessSessionKey !=null){
      debugPrint('getSessionToken: access does not exist');
      debugPrint("accessSessionKey1:${accessSessionKey.toString()}");
    }else{
      debugPrint('getSessionToken: access does not exist');
      debugPrint("accessToken2:${accessToken.toString()}");
      debugPrint("accessSessionKey2:${accessSessionKey.toString()}");
    }
    print(accessToken);
    print(accessSessionKey);
    return accessToken ?? accessSessionKey;
  }

  String? getUserId() {
    final userId = _prefs.getString(_userIdKey);
    if (userId != null) {
      debugPrint('getUserId: user exists');
    } else {
      debugPrint('getUserId: user does not exist');
    }
    return userId;
  }

  Future<void> resetAllSession() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_userIdKey);

  }

  Future<void> removeSessionKey() async{
    _prefs.remove(_accessSessionKey);
  }

  bool isFirstTime() => _prefs.getBool(_firstTimerKey) ?? true;
}
