
import '../../../../core/utils/typedefs.dart';

abstract class AuthRepo{

  ResultFuture<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String gender,
    required String phone,
    required String password,

});

  ResultFuture<void> login({
    required String email,
    required String password,
});

 // ResultFuture<bool> verifyToken();
}