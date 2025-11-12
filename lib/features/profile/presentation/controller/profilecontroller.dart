
import 'package:e_comapp/features/profile/domain/model/profilemodel.dart';
import 'package:e_comapp/features/profile/domain/repos/pofile_repo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController(this.productRepo);
  final ProfileRepo productRepo;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var profileItem = Rx<ProfileModel?>(null);
  var userName = 'Faysal Hossain'.obs;
  var userEmail = 'munnafh11@gmail.com'.obs;
  var userImage = RxnString();


  void changePassword() {
    Get.snackbar('Change Password', 'Password update page coming soon!');
  }
  Future<void> fetchProduct() async {
    try {
      isLoading.value = true;
      update();

      final result = await productRepo.getProfile();

      result.fold(
            (failure) {
          errorMessage.value = failure.errorMessage;
        },
            (fetchedProduct) {
          // Single product → wrap into ProfileModel
            //  profileItem.value = ProfileModel.fromJson(fetchedProduct);
        },
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }



  void manageAddress() {}
  void viewOrders() {}
  void paymentMethods() {}
  void helpSupport() {}
  void privacyPolicy() {}

  void logout() {
    Get.offAllNamed('/login');
  }
}
