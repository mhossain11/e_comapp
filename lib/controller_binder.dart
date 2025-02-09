

import 'package:e_comapp/features/wishlist/controller/wishlist_controller.dart';
import 'package:get/get.dart';

import 'core/di/injection_container.main.dart';
import 'features/auth/presentation/controller/auth_controllere.dart';
import 'features/categories/presentation/controller/category_controller.dart';
import 'features/homepage/controllers/homeController.dart';
import 'features/product_details/presentations/controller/product_details_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController(sl()));
    Get.put(HomeController());
    Get.put(CategoryController(sl()));
    Get.put(WishListController());
    Get.put(ProductDetailsController(sl()));
  }

}