import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool editProfile = false.obs;

  editProfileFunction() {
    editProfile.value = true;
    print('editing starts');
    print(editProfile.value);
  }

  stopEditProfileFunction() {
    editProfile.value = false;
    print('editing starts');
  }
}
