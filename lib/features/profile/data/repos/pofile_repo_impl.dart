
import 'package:dartz/dartz.dart';
import 'package:e_comapp/core/utils/typedefs.dart';

import 'package:e_comapp/features/profile/domain/model/profilemodel.dart';
import 'package:e_comapp/features/profile/domain/repos/pofile_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasource/profile_remote_data_src.dart';

 class ProfileRepoImpl  implements ProfileRepo{
  ProfileRepoImpl(this.profileRemoteDataSrc);
   final ProfileRemoteDataSrc profileRemoteDataSrc;

  @override
  ResultFuture<ProfileModel> getProfile() async{
    try{
      final result = await profileRemoteDataSrc.getProfile();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(message: e.message,
          statusCode: e.statusCode));
    }
  }


}