import 'package:e_comapp/controller_binder.dart';
import 'package:e_comapp/core/router/app_router.dart';
import 'package:e_comapp/core/router/getx_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> e751dd7 ( product details screen change)
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/di/injection_container.main.dart';
import 'features/auth/presentation/screen/login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
<<<<<<< HEAD
  runApp(const ProviderScope(child: MyApp()));
=======
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),

    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context,child)=> const ProviderScope(child: MyApp()),
  ));
>>>>>>> e751dd7 ( product details screen change)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: AppRoutes.loginScreen,
=======
      initialRoute: AppRoutes.dashboardScreen,
>>>>>>> e751dd7 ( product details screen change)
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white),
        useMaterial3: true,
      ),
      getPages: GetAppRouter().getRoutes(),
     // home: const HomeScreen(),
    );
  }
}
