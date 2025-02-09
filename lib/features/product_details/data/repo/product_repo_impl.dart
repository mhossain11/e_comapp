

import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/error/failures.dart';
import 'package:e_comapp/core/utils/typedefs.dart';

import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:e_comapp/features/product_details/data/datasources/product_remote_data_src.dart';

import '../../domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo{
  ProductRepoImpl(this._remoteDataSource);
  final ProductRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<Products> getProduct(String productId) async{

    try{
      final result = await _remoteDataSource.getProducts(productId);
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(message: e.message,
          statusCode: e.statusCode));
    }
  }


}