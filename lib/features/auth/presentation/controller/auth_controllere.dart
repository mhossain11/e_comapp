import 'package:e_comapp/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:e_comapp/features/homepage/presentation/screen/home_screen.dart';
import 'package:get/get.dart';

import '../../domains/repos/auth_repo.dart';
import '../screen/login_screen.dart';



class AuthController extends GetxController{
final AuthRepo _authRepo;

AuthController(this._authRepo);

var isLoading = false.obs;
var errorMessage = RxnString();

Future<void>login({
  required String email,
  required String password,
})async {
  isLoading.value = true;
  final result = await _authRepo.login(
      email: email,
      password: password);
  result.fold(
          (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
          (_) {
        Get.snackbar('Success', 'Login successful');
        isLoading.value = false;
        Get.to(() => const DashboardScreen());
      });
}

Future<void> register({
  required String firstname,
  required String lastname,
  required String email,
  required String gender,
  required String phone,
  required String password,
}) async {
  isLoading.value = true;
  final result = await _authRepo.register(
    firstname: firstname,
    lastname: lastname,
    email: email,
    gender: gender,
    phone: phone,
    password: password,
  );
  result.fold(
          (failure) {
        errorMessage.value = failure.message;
        Get.snackbar('Error', failure.message);
        isLoading.value = false;
      }, (_) {
    Get.snackbar('Success', 'Registration successful');
    isLoading.value = false;
    Get.offAll(() => const LoginScreen());
  });
}
}