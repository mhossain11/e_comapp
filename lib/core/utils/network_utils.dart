 import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../app/cache/cache_helper.dart';
import '../di/injection_container.dart';
import '../di/injection_container.main.dart';

abstract class NetworkUtils {
  const NetworkUtils();

  static Future<void> renewToken(Response response) async {
    if (response.headers['authorization'] != null) {
      debugPrint('EXPIRED... RENEWING');
      var token = response.headers['authorization'] as String;
      debugPrint('TOKEN: $token');
      if (token.startsWith('Bearer')) {
        token = token.replaceFirst('Bearer', '').trim();
      }
      await sl<CacheHelper>().cacheAccessToken(token);
    }
  }
}
