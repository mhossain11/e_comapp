import 'package:e_comapp/features/cart/presentation/screen/cart_screen.dart';


import 'package:e_comapp/features/dashboard/presentation/screen/dashboard_screen.dart';

import 'package:e_comapp/features/homepage/presentation/screen/home_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/register_screen.dart';

import '../../features/categories/domain/model/CategoryModel.dart';

import '../../features/categories/presentation/sub_category_screen/sub_category_screen.dart' hide SubCategoryScreen;
import '../../features/product_details/presentations/screen/product_details.dart';

import '../../features/categories/presentation/screen/allViewCategory_screen.dart';
import '../../features/categories/presentation/screen/subCategory_screen.dart';
import '../../features/product_details/presentations/screen/product_details.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';

import 'app_router.dart';

class GetAppRouter {
  List<GetPage> getRoutes() {
    return [

      GetPage(
        name: AppRoutes.initial,
        page: () => const SplashScreen(),
        // Bindings for the splash screen if necessary
      ),
      GetPage(
        name: AppRoutes.dashboardScreen,
        page: () => DashboardScreen(),
        // Bindings for the onboarding screen if necessary
      ),

      GetPage(
        name: AppRoutes.homePage,
        page: () => const HomeScreen(),
        // Bindings for the onboarding screen if necessary
      ),
      GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginScreen(),
        // Bindings for the onboarding screen if necessary
      ),
      GetPage(
        name: AppRoutes.registerScreen,
        page: () => const RegisterScreen(),
        // Bindings for the onboarding screen if necessary
      ),


     /* GetPage(
        name: AppRoutes.subCategoryScreen,
        page: () {
    final products = Get.arguments['productItem'] as CategoryModel;
    }),*/
     /* GetPage(
        name: AppRoutes.specialCategoryScreen,
        page: () => const SpecialCategoryScreen(),
        // Bindings for the onboarding screen if necessary
      ),*/

      GetPage(
        name: AppRoutes.subCategoryScreen,
        page: () {
          final products = Get.arguments['productItem'] as ProductCategoriesModel;

       //   final index = Get.arguments['index'] as int;
    if (products == null) {
    // Redirect to home screen if category is null or invalid
    return const HomeScreen();
    }
    return SubCategoryScreen(products);
    },
        // Bindings for the onboarding screen if necessary
      ),

    GetPage(
    name: AppRoutes.productDetailScreen,
    page: () {
    final productId = Get.arguments['productId']; // Retrieve the productId from the URL
    // Retrieve the productId from the URL
    return ProductDetails(productId: productId,);
    },),


      GetPage(
        name: AppRoutes.cartScreen,

        page: () => const CartScreen(),
      ),

    /* GetPage(
        name: AppRoutes.dashboardScreen,
        page: () => const DashboardScreen(),
        // Bindings for the onboarding screen if necessary
      ),*/

      /*  page: () {
          return CartScreen();
        }
      ),*/

     GetPage(
        name: AppRoutes.allViewCategoryScreen,
        page: () {
          final productId = Get.arguments['products'];
          final categoryName = Get.arguments['categoryName'];
          return AllViewCategoryScreen(products: productId,categoryName: categoryName);
        } ,
        // Bindings for the onboarding screen if necessary
      ),


        // Bindings for the onboarding screen if necessary
      //),
      /* GetPage(
        name: AppRoutes.cartProductScreen,
        page: () => const CartProductsView(),
        // Bindings for the onboarding screen if necessary
      ),
      GetPage(
          name: AppRoutes.checkoutScreen,
          page: () {
            final checkoutUrl = Get.parameters['checkoutUrl'] as String;
            return CheckoutView(sessionUrl: checkoutUrl);
          }
          // Bindings for the onboarding screen if necessary
          ),

      GetPage(
        name: '/:category_name',
        page: () {
          // Retrieve the extra argument passed
          final category = Get.arguments as ProductCategoryModel?;
          if (category == null) {
            // Redirect to home screen if category is null or invalid
            return const HomeScreen();
          }
          return CategorizedProductsView(category);
        },
        // Optional transition or bindings can be added here
      ),*/
    ];
  }
}




