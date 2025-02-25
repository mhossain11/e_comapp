import 'package:e_comapp/features/dashboard/presentation/controller/navigation_controller.dart';
import 'package:e_comapp/features/homepage/presentation/screen/home_screen.dart';
import 'package:e_comapp/features/profile/presentation/screen/profile_screen.dart';
import 'package:e_comapp/features/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../core/res/styles/colors.dart';
import '../../../cart/presentation/screen/cart_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  static const path = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final activeNavIndex = ref.watch(navigationController);
    return Scaffold(
      body: IndexedStack(
        index: activeNavIndex,
        children: const [
          HomeScreen(),
          CartScreen(),
          WishListScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
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
    );
  }
}
