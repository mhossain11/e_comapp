import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/error/failures.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/categories/data/datasources/categorie_remote_data_src.dart';

import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';

import '../../domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo{
  CategoryRepoImpl(this._categoryRemoteDataSrc);

  final CategoryRemoteDataSrc _categoryRemoteDataSrc;


  @override
  ResultFuture<List<CategoryModel>> getCategory() async{
    try{
      final result = await _categoryRemoteDataSrc.getCategory();
      return Right(result);
    }on ServerException catch(e){
      return left(ServerFailure.fromException(e));
    }

  }

}