import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domains/repos/auth_repo.dart';
import '../datasources/auth_remote_data_src.dart';

class AuthRepoImpl implements AuthRepo{

  AuthRepoImpl(this._remoteDataSrc);
  
  final AuthRemoteDataSrc _remoteDataSrc;

  @override
  ResultFuture<void> login({
    required String email,
    required String password}) async{
    try{
     final result= await _remoteDataSrc.login(
         email: email,
         password: password);
      return right(result);
    }on ServerException catch (e){
      return Left(
          ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async{
    try{
      await _remoteDataSrc.register(
          firstname: firstname,
          lastname: lastname,
          email: email,
          phone: phone,
          password: password,
          confirmPassword: confirmPassword
      );
      return const Right(null);
    } on ServerException catch (e){
      return Left(
          ServerFailure.fromException(e));
    }
  }

/*  @override
  ResultFuture<bool> verifyToken() async{
    try{
      final result = await _remoteDataSrc.
      return right(r);
    } on ServerException catch (e){
      return Left(_l);
    }
  }*/

}