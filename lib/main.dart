import 'package:e_comapp/controller_binder.dart';
import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/core/router/getx_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/di/injection_container.main.dart';
import 'features/auth/presentation/screen/login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();

//  runApp(const ProviderScope(child: MyApp()));
  runApp(
      ScreenUtilInit(
    designSize: const Size(360, 690),

    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context,child)=> const ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,

      initialBinding: ControllerBinder(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:BottomNavigationBarThemeData(
          backgroundColor: Colors.white
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white),
        useMaterial3: true,
      ),
      getPages: GetAppRouter().getRoutes(),
     // home: const HomeScreen(),
    );
  }
}
