

import 'dart:ui';
<<<<<<< HEAD
=======
import '../app/cache/cache_helper.dart';
import '../di/injection_container.main.dart';



>>>>>>> e751dd7 ( product details screen change)

extension StringExt on String {

  Map<String, String> get toHeaders {
    return {
      'Authorization': 'Bearer $this',
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }
<<<<<<< HEAD
  Map<String, String> get toHeader {
   String? sessionKey ='w6ochuwh3mjfyhrr1awd9xz1mhxa48o3';
    return {
      'Authorization': 'Bearer $this',
      'Content-Type': 'application/json',
      "X-Session-Key": sessionKey,
    };
=======

  Map<String, String> get toHeader {
    String? token = sl<CacheHelper>().getToken();
    String? sessionKey = sl<CacheHelper>().getSession();

    if (sessionKey != null && token != null) {
      print("Using X-Session-Key: $sessionKey");
      return {
        "Authorization": "Bearer $token",
        "X-Session-Key": sessionKey,
        "Content-Type": "application/json",
      };

    }
   else if (token != null && token.isNotEmpty) {
      print("Using Bearer Token: $token");
      return {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      };
    } else if (sessionKey != null && sessionKey.isNotEmpty) {
      print("Using X-Session-Key: $sessionKey");
      return {
        "X-Session-Key": sessionKey,
        "Content-Type": "application/json",
      };

    }

    return {"Content-Type": "application/json"};
>>>>>>> e751dd7 ( product details screen change)
  }

  String get obscureEmail {
    // Split the email into username and domain
    final index = indexOf('@');
    var username = substring(0, index);
    final domain = substring(index + 1);
    // Obscure the username and display only the first and last characters
    username = '${username[0]}****${username[username.length - 1]}';
    // Return the obscured email
    return '$username@$domain';
  }

  Color get colour {
    return Color(int.parse(replaceFirst('#', 'ff'), radix: 16));
  }

  String truncateWithEllipsis(int maxLength) {
    if (length <= maxLength) {
      return this;
    } else {
      return '${substring(0, maxLength)}...';
    }
  }
}

