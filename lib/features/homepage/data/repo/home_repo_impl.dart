
import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/error/failures.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/homepage/domain/model/searchmodel.dart';
import 'package:e_comapp/features/homepage/domain/repo/home_repo.dart';

import '../datasources/home_remote_data_src.dart';

class HomeRepoImpl extends HomeRepo{
  HomeRepoImpl(this._remoteDataSrc);
  final HomeRemoteDataSrc _remoteDataSrc;

  @override
  ResultFuture<List<SearchModel>> searchData(String search) async{
    try{
      final result =await _remoteDataSrc.searchData(search);
      return Right(result);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message, statusCode: e.statusCode));

    }
  }

}