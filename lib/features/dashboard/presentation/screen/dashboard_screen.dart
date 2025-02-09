import 'package:e_comapp/features/dashboard/presentation/controller/navigation_controller.dart';
import 'package:e_comapp/features/explore/presentation/screen/explore_screen.dart';
import 'package:e_comapp/features/homepage/presentation/screen/home_screen.dart';
import 'package:e_comapp/features/profile/presentation/screen/profile_screen.dart';
import 'package:e_comapp/features/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/res/styles/colors.dart';

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
          ExploreScreen(),
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
                icon: Icon(IconlyBroken.discovery),
                activeIcon: Icon(IconlyBold.discovery,),
                label: 'Explore'
            ),

            BottomNavigationBarItem(
                icon: Icon(IconlyBroken.heart),
                activeIcon: Icon(IconlyBold.heart,),
                label: 'Home'
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
