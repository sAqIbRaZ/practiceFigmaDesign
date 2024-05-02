import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isFirstScreen = true.obs;
  RxBool is2ndScreen = false.obs;
  RxBool is3rdScreen = false.obs;

  // change indicator color when onboarding screen changes
  changeIndicatorColor(int currentPageIndex) {
    if (currentPageIndex == 0) {
      is2ndScreen.value = false;
      is3rdScreen.value = false;
    }
    if (currentPageIndex == 1) {
      is2ndScreen.value = true;
      is3rdScreen.value = false;
    } else if (currentPageIndex == 2) {
      is3rdScreen.value = !is3rdScreen.value;
    }
  }

  // currently selected navbar index
  RxInt currentNavBarIndex = 0.obs;

  changeCurrentNavBarIndexFunction(int index) {
    currentNavBarIndex.value = index;
    print('current navbar index is $index');
  }

  RxString currentLanguage = 'English'.obs;

  selectLanguageFunction(String language) {
    currentLanguage.value = language;
  }

  RxBool isObsecurePassword = false.obs;
  RxBool isObsecureConfirmPawwordPassword = false.obs;

  obscurePasswordFunction() {
    isObsecurePassword.value = !isObsecurePassword.value;
  }

  obscureConfirmPasswordFunction() {
    isObsecureConfirmPawwordPassword.value =
        !isObsecureConfirmPawwordPassword.value;
  }

  // i agree to terms and conditions

  RxBool agreeToTerms = false.obs;

  agreeToTermsFunction() {
    agreeToTerms.value = !agreeToTerms.value;
  }
}
