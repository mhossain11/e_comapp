import 'dart:async';

import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _isFaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 400),(){
      setState(() {
        _isFaded = true;
      });

    });

    Future.delayed(Duration(seconds: 4 ),(){
      Get.offAndToNamed(AppRoutes.dashboardScreen);
    });

  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(tag: 'splash',
                      child: AnimatedOpacity(
                          opacity:_isFaded ? 1 :0,
                          duration: Duration(seconds: 2),
                        curve: Curves.easeIn,
                        child: Image.asset(
                          Media.splashLogo,
                        height: 200,
                          width: 200,
                        ),
                      )
                  ),
                  const SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: _isFaded ? 1 : 0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeIn,
                    child: Text.rich(
                      TextSpan(
                        text: "IN",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "VENTORY",
                            style: TextStyle(
                              color: const Color(0xFF1F75FE),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
