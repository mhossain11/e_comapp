import '../../../../core/utils/typedefs.dart';
import '../model/profilemodel.dart';

abstract class ProfileRepo{
  ResultFuture<ProfileModel> getProfile();
}