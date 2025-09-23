

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../homepage/domain/model/sliderModel.dart';
import '../../domain/model/CategoryModel.dart';
import '../../domain/model/Slider_model.dart';
import '../../domain/model/specialCategoryProduct_model.dart';
import '../../domain/model/special_categories_model/special_categories_Uid_model.dart';
import '../../domain/repo/category_repo.dart';
import '../datasources/categorie_remote_data_src.dart';

class CategoryRepoImpl implements CategoryRepo{
  CategoryRepoImpl(this._categoryRemoteDataSrc);

  final CategoryRemoteDataSrc _categoryRemoteDataSrc;


  @override
  ResultFuture<List<ProductCategoriesModel>> getCategory() async{

    try{
      final result = await _categoryRemoteDataSrc.getCategory();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));

    }

  }

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
  ResultFuture<List<SliderModel>> getBanner() async {
    try {
      final result = await _categoryRemoteDataSrc.getBanner();
      return Right(result);
    } on ServerException catch (e) {
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


}