import 'package:e_comapp/features/cart/data/datasource/cart_remore_data_src.dart';
import 'package:e_comapp/features/cart/data/repo/cartlist_repo_impl.dart';
import 'package:e_comapp/features/cart/domains/repo/cartlist_repo.dart';
import 'package:e_comapp/features/product_details/data/datasources/product_remote_data_src.dart';
import 'package:e_comapp/features/product_details/data/repo/product_repo_impl.dart';
import 'package:e_comapp/features/product_details/domain/repo/product_repo.dart';
import 'package:e_comapp/features/product_details/presentations/controller/product_details_controller.dart';
import 'package:e_comapp/features/profile/data/datasource/profile_remote_data_src.dart';
import 'package:e_comapp/features/wishlist/data/datasources/wish_remote_data_src.dart';
import 'package:e_comapp/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:e_comapp/features/wishlist/domain/repos/wishlist_repo.dart';
import 'package:e_comapp/features/wishlist/presentation/controller/wishlist_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_src.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domains/repos/auth_repo.dart';
import '../../features/auth/presentation/controller/auth_controllere.dart';
import '../../features/cart/presentation/controller/cart_controller.dart';
import '../../features/categories/data/datasources/categorie_remote_data_src.dart';
import '../../features/categories/data/repo/category_repo_impl.dart';
import '../../features/categories/domain/repo/category_repo.dart';
import '../../features/categories/presentation/controller/category_controller.dart';
import '../app/cache/cache_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(http.Client.new);
  await _cacheInit();
  await _userAuthInit();
  await _categoryInit();
  await _productInit();
  await _profileInit();
  await _wishlistInit();
  await _cartInit();
/*

  await _profileInit();
  */
}

<<<<<<< HEAD






=======
>>>>>>> e751dd7 ( product details screen change)
Future<void> _cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton<SharedPreferences>(() => prefs);
}

Future<void> _userAuthInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<AuthRemoteDataSrc>(() =>
      AuthRemoteDataSrcImpl(sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(sl<AuthRemoteDataSrc>()));

  // Registering AuthController
  sl.registerLazySingleton<AuthController>(
      () => AuthController(sl<AuthRepo>()));
}

Future<void> _categoryInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<CategoryRemoteDataSrc>(() =>
      CategoryRemoteDataSrcImpl(
          sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<CategoryRepo>(
      () => CategoryRepoImpl(sl<CategoryRemoteDataSrc>()));

  // Registering CategoryController
  sl.registerLazySingleton<CategoryController>(
      () => CategoryController(sl<CategoryRepo>()));
}

Future<void> _productInit() async{
  sl.registerLazySingleton<ProductRemoteDataSrc>(
      ()=>ProductRemoteDataSrcImp(sl()));

  sl.registerLazySingleton<ProductRepo>(
      ()=>ProductRepoImpl(sl<ProductRemoteDataSrc>()));

  // Single productDetails
  sl.registerLazySingleton<ProductDetailsController>(
          ()=>ProductDetailsController(sl<ProductRepo>()));
}

Future<void> _profileInit() async{
  sl.registerLazySingleton<ProfileRemoteDataSrc>(
      ()=>ProfileRemoteDataSrcImpl(sl()));


}

Future<void> _wishlistInit() async{
  sl.registerLazySingleton<WishRemoteDataSrc>(
          ()=>WishRemoteDataSrcImpl(sl()));
  sl.registerLazySingleton<WishListRepo>(
      ()=>WishListRepoImpl(sl<WishRemoteDataSrc>()));

  sl.registerLazySingleton<WishListController>(
      ()=>WishListController(sl<WishListRepo>()));

}

Future<void> _cartInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<CartRemoteDataSrc>(() =>
      CartRemoteDataSrcImpl(sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<CartListRepo>(
          () => CartListRepoImpl(sl<CartRemoteDataSrc>()));

  // Registering CategoryController
  sl.registerLazySingleton<CartController>(
          () => CartController(sl<CartListRepo>()));
}


/*
Future<void> _productInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<ProductRemoteDataSrc>(
  () => ProductRemoteDataSrcImpl(sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<ProductRepo>(
      () => ProductRepoImpl(sl<ProductRemoteDataSrc>()));

  // Registering CategoryController
  sl.registerLazySingleton<ProductController>(
      () => ProductController(sl<ProductRepo>()));
}



Future<void> _profileInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<UserRemoteDataSrc>(() =>
      UserRemoteDataSrcImpl(sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<UserRepo>(
          () => UserRepoImpl(sl<UserRemoteDataSrc>()));

  // Registering CategoryController
  sl.registerLazySingleton<ProfileController>(
          () => ProfileController(sl<UserRepo>()));
}

Future<void> _wishlistInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<WishlistRemoteDataSrc>(() =>
      WishlistRemoteDataSrcImpl(sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<WishlistRepo>(
          () => WishlistRepoImpl(sl<WishlistRemoteDataSrc>()));

  // Registering CategoryController
  sl.registerLazySingleton<WishlistController>(
          () => WishlistController(sl<WishlistRepo>()));
}*/
