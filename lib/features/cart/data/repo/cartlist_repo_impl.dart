import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/cart/data/datasource/cart_remore_data_src.dart';
import 'package:e_comapp/features/cart/domains/models/cart_Items.dart';
import 'package:e_comapp/features/cart/domains/repo/cartlist_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class CartListRepoImpl implements CartListRepo{
  CartListRepoImpl(this._cartRemoteDataSrc);

  final CartRemoteDataSrc _cartRemoteDataSrc;

  @override
  ResultFuture<List<CartsItems>> getCartList() async{
    try{
      final result = await _cartRemoteDataSrc.getCart();
      return Right(result);
    }on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }


  @override
  ResultFuture<void> addCartList({
    required String productUid,
    required String imageUid,
    required String sizeUid,
    required String colorUid,
    required int quantity}) async{
    try {
      final result = await _cartRemoteDataSrc.addToCart(
          productUid: productUid,
        imageUid: imageUid,
        sizeUid: sizeUid,
        colorUid: colorUid,
        quantity: quantity
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }


  @override
  ResultFuture<void> removeFromCart({
    required String  cartProductUid}) async{
    try{
      await _cartRemoteDataSrc.removeFromCart(cartProductUid: cartProductUid);
      return const Right(null);
    }on ServerException catch(e){
      return Left(ServerFailure(message: e.message,statusCode: e.statusCode));
    }
  }

}