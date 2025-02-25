
import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/error/exceptions.dart';
import 'package:e_comapp/core/error/failures.dart';
import 'package:e_comapp/features/wishlist/data/datasources/wish_remote_data_src.dart';
import 'package:e_comapp/features/wishlist/domain/repos/wishlist_repo.dart';

import '../../../../core/utils/typedefs.dart';
import '../../domain/models/wish_items.dart';


class WishListRepoImpl implements WishListRepo{
  const WishListRepoImpl(this._wishRemoteDataSrc);

final  WishRemoteDataSrc _wishRemoteDataSrc;


  @override
  ResultFuture<List<WishItem>> getWishlist() async{
    try{
      final result = await _wishRemoteDataSrc.getWishList();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(
          message: e.message,
          statusCode: e.statusCode));
    }

  }

  @override
  ResultFuture<void> addWishList({
    required String productId,
    required String imageId,
    required String sizeId,
    required String colorId,

  }) async{
    try{
      final result = await _wishRemoteDataSrc.addWishList(
          productId: productId,imageId: imageId,sizeId: sizeId,colorId: colorId);
      return right(result);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }


  @override
  ResultFuture<void> removeWish({
    required String wishUid}) async{
   try{
     await _wishRemoteDataSrc.removeWish(wishUid:wishUid);
     return right(null);
   }on ServerException catch(e){
     return Left(ServerFailure(message: e.message,statusCode: e.statusCode));

   }
  }
}