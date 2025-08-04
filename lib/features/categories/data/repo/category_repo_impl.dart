import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/error/failures.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/categories/data/datasources/categorie_remote_data_src.dart';

import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';
<<<<<<< HEAD

=======
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:e_comapp/features/categories/domain/model/Slider_model.dart';
import 'package:e_comapp/features/categories/domain/model/special_categories_model/special_categories_Uid_model.dart';
import 'package:e_comapp/features/categories/domain/model/special_categories_model/special_category_model.dart';

import '../../domain/model/specialCategoryProduct_model.dart';
>>>>>>> e751dd7 ( product details screen change)
import '../../domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo{
  CategoryRepoImpl(this._categoryRemoteDataSrc);

  final CategoryRemoteDataSrc _categoryRemoteDataSrc;


  @override
<<<<<<< HEAD
  ResultFuture<List<CategoryModel>> getCategory() async{
=======
  ResultFuture<List<ProductCategoriesModel>> getCategory() async{
>>>>>>> e751dd7 ( product details screen change)
    try{
      final result = await _categoryRemoteDataSrc.getCategory();
      return Right(result);
    }on ServerException catch(e){
<<<<<<< HEAD
      return left(ServerFailure.fromException(e));
=======
      return Left(ServerFailure.fromException(e));
>>>>>>> e751dd7 ( product details screen change)
    }

  }

<<<<<<< HEAD
=======
  @override
  ResultFuture<List<SpecialCategoryProductModel>> getSpecialCategories() async{
    try{
      final result = await _categoryRemoteDataSrc.getSpecialCategories();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));
    }
  }

  /*@override
  ResultFuture<List<SpecialCategoriesUidModel>> getSpecialCategoriesUid(String uid) async{
    try{
      final result = await _categoryRemoteDataSrc.getSpecialCategoriesUid(uid);
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));
    }
  }
*/
  @override
  ResultFuture<List<SliderModel>> getBanner() async{
    try{
      final result = await _categoryRemoteDataSrc.getBanner();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<SliderModel>> getSlider() async{
    try{
      final result = await _categoryRemoteDataSrc.getSlider();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SpecialCategoriesUidModel> getProducts(String productId) async{
    try{
      final result = await _categoryRemoteDataSrc.getProducts(productId);
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));
    }
  }

>>>>>>> e751dd7 ( product details screen change)
}