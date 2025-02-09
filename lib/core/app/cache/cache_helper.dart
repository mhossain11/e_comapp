import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  const CacheHelper(this._prefs);

  final SharedPreferences _prefs;
  static const _accessTokenKey = 'user-access-token';
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

  Future<bool> cacheUserId(String userId) async {
    try {
      final result = await _prefs.setString(_userIdKey, userId);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<void> cacheFirstTimer() async {
    await _prefs.setBool(_firstTimerKey, false);
  }

  bool getFirstTimer() {
    final isFirstTimer = _prefs.getBool(_firstTimerKey);

    return isFirstTimer ?? true;
  }

  String? getAccessToken() {
    final accessToken = _prefs.getString(_accessTokenKey);
    if (accessToken != null) {
      debugPrint('getSessionToken: access Token exists');
    } else {
      debugPrint('getSessionToken: access does not exist');
    }
    return accessToken;
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

  Future<void> resetSession() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_userIdKey);
  }

  bool isFirstTime() => _prefs.getBool(_firstTimerKey) ?? true;
}
