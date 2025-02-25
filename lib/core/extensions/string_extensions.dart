

import 'dart:ui';

extension StringExt on String {

  Map<String, String> get toHeaders {
    return {
      'Authorization': 'Bearer $this',
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }
  Map<String, String> get toHeader {
   String? sessionKey ='w6ochuwh3mjfyhrr1awd9xz1mhxa48o3';
    return {
      'Authorization': 'Bearer $this',
      'Content-Type': 'application/json',
      "X-Session-Key": sessionKey,
    };
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

