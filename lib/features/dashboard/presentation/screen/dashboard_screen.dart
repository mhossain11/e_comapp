import 'package:e_comapp/features/dashboard/presentation/controller/navigation_controller.dart';
import 'package:e_comapp/features/homepage/presentation/screen/home_screen.dart';
import 'package:e_comapp/features/profile/presentation/screen/profile_screen.dart';
import 'package:e_comapp/features/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../core/res/styles/colors.dart';
import '../../../cart/presentation/screen/cart_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../cart/presentation/controller/cart_controller.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const path = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  final NavigationController navController = Get.find<NavigationController>();
  final CartController cartController = Get.find<CartController>();
  int navIndex =0;
  void changeIndex(int newIndex) async{
    final prefs = await SharedPreferences.getInstance();
    const accessTokenKey = 'user-access-token';
    final accessToken = prefs.getString(accessTokenKey);
    if (newIndex == 2 && (accessToken == null || accessToken.isEmpty)) {
      Get.toNamed('/login');
    }else if(newIndex == 3 && (accessToken == null || accessToken.isEmpty)){
      Get.toNamed('/login');
    }
    else {
      setState(() {
        navController.activeNavIndex.value = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: navController.activeNavIndex.value, //  Rx Variable ব্যবহার

        children: const [
          HomeScreen(),
          CartScreen(),
          WishListScreen(),

          ProfileScreen()
        ],
      )),
      /*bottomNavigationBar:BottomNavigationBar(
          currentIndex: activeNavIndex,
          onTap: (index){
            ref.read(navigationController.notifier).changeIndex(index);
          },
          backgroundColor: Colors.red,
          selectedItemColor: Colours.lightThemePrimaryColour,
          unselectedItemColor: Colours.lightThemeSecondaryTextColour,

          items: const [
            BottomNavigationBarItem(
                icon: Icon(IconlyBroken.home),
                activeIcon: Icon(IconlyBroken.home,),
                label: 'Home'
            ),

            BottomNavigationBarItem(
              icon: badges.Badge(
                badgeContent: Text(
                  '4',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                badgeStyle:badges.BadgeStyle(badgeColor: Colors.blueAccent) ,
                child: Icon(IconlyBroken.bag),
              ),
             // activeIcon: Icon(IconlyBold.bag_2,),
              label: 'Cart',
            ),



            BottomNavigationBarItem(
                icon: Icon(IconlyBroken.heart),
                activeIcon: Icon(IconlyBold.heart,),
                label: 'Favourite'
            ),

            BottomNavigationBarItem(
                icon: Icon(IconlyBroken.profile),
                activeIcon: Icon(IconlyBold.profile,),
                label: 'profile'
            ),
          ]) ,



      )),*/

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: navController.activeNavIndex.value,
        onTap: (index) {
          navIndex =index;
          changeIndex(navIndex);
        },
        backgroundColor: Colors.red,
        selectedItemColor: Colours.lightThemePrimaryColour,
        unselectedItemColor: Colours.lightThemeSecondaryTextColour,
        items: [
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.home),
              activeIcon: Icon(IconlyBroken.home),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Obx((){
              final cartCount = cartController.cartList.length;
              if(cartCount == 0){
                return const Icon(IconlyBroken.bag);
              }else{

                return badges.Badge(
                  //isBadgeVisible: cartController.cartList.isNotEmpty,
                  badgeContent: Text(
                    cartController.cartList.length.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: const Icon(IconlyBroken.bag),
                );
              }
            }),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.heart),
              activeIcon: Icon(IconlyBold.heart),
              label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.profile),
              activeIcon: Icon(IconlyBold.profile),
              label: 'Profile'),
        ],
      )),

    );
  }
}
