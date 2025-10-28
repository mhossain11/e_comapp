
import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/checkout/data/datasource/remote/checkout_remote_data_src.dart';
import 'package:e_comapp/features/checkout/domain/model/DeliveryAddress.dart';
import 'package:e_comapp/features/checkout/domain/repos/checkout_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../cart/data/datasource/cart_remore_data_src.dart';
import '../../domain/model/Checkoutmodel.dart';

class CheckOutRepoImpl extends CheckoutRepo{
  CheckOutRepoImpl(this._checkoutRemoteDataSrc);

  final CheckoutRemoteDataSrc _checkoutRemoteDataSrc;

  @override
  ResultFuture<CheckoutModel> checkoutData({
    required String cartUid,
    required DeliveryAddress deliveryAddress,
    String? notes}) async{

    try{
      final result =  await _checkoutRemoteDataSrc.checkOutData(
        cartUid: cartUid,
        deliveryAddress: deliveryAddress,
        notes: notes,
      );
      return  Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(message: e.message,statusCode: e.statusCode));
    }
  }

}