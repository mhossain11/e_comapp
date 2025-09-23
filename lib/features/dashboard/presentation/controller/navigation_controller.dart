

import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  GetX Controller
class NavigationController extends GetxController {
  var activeNavIndex = 0.obs; // Rx Variable


  /*void changeIndex(int newIndex) async{
    final _prefs = await SharedPreferences.getInstance();
   const _accessTokenKey = 'user-access-token';
     final accessToken = _prefs.getString(_accessTokenKey);
    if (newIndex == 2 && accessToken!.isEmpty) {
      Get.toNamed('/login');
    } else {
      activeNavIndex.value = newIndex; // ✅ অন্যথায় নরমাল নেভিগেশন হবে
    }
  }*/
}


/*//Riverpod Code

final navigationController =
StateNotifierProvider<NavigationControllerNotifier,int>
  ((ref)=>NavigationControllerNotifier());


class NavigationControllerNotifier extends StateNotifier<int>{
  NavigationControllerNotifier():super(0);

  void changeIndex(int newIndex){
    state = newIndex;
  }


}

}*/

