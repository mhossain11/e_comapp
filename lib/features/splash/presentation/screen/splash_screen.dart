import 'dart:async';

import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/res/media.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const path = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Timer(const Duration(seconds: 3), _navigateToHome);
      });
    });

  }

  void _navigateToHome() {
    if (!mounted) return; // Context available কিনা চেক করা
    Get.offAndToNamed(AppRoutes.dashboardScreen);
   // Get.offAndToNamed(DashboardScreen.path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(Media.splashLogo,
                  width: 200,
                  height: 150,
                  repeat: true),
            ],
          ),
        ),
      ),
    );
  }
}
