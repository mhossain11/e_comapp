<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:e_comapp/features/homepage/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';
import '../../../auth/presentation/screen/login_screen.dart';
>>>>>>> e751dd7 ( product details screen change)

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const path = '/profile';

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold();
=======
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async{
           await sl<CacheHelper>().resetAllSession();

            Get.offAllNamed(AppRoutes.dashboardScreen);
          },
              icon: const Icon(Icons.login))
        ],
      ),
    );
>>>>>>> e751dd7 ( product details screen change)
  }
}
