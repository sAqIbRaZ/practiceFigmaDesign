import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/custom_toast_message.dart';
import 'package:food_delivery_app/views/auth/forgot_password/enter_code_screen.dart';
import 'package:food_delivery_app/views/auth/register/verifyEmailScreen.dart';
import 'package:food_delivery_app/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_app/views/home_screen/first_home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository.dart';

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

  ///
  /// get phone code of the user
  ///
//

  RxString userPhoneNumberCode = ''.obs;

  void userPhoneNumberCodeFunction(String phoneNumberCode) {
    userPhoneNumberCode.value = phoneNumberCode;
  }

  ///
  /// isRegistering
  ///
//

  RxBool isRegistering = false.obs;

  void isRegisteringUserFunction(bool value) {
    isRegistering.value = value;
  }

  ///
  ///sign in circular progress indicator
//

  RxBool isLoading = false.obs;

  void isLoadingFunction(bool value) {
    isLoading.value = value;
  }

  ///
  ///
  /// forgetRequestId
  ///
  RxString forgetRequestId = ''.obs;

  void forgetRequestIdFunction(value) {
    forgetRequestId.value = value;
  }

  ///
  /// text editing controllers
  ///
  // sign in controllers
  final TextEditingController emailSignInController = TextEditingController();
  final TextEditingController passwordSignInController =
      TextEditingController();

  // signup controllers

  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController passwordSignUpController =
      TextEditingController();
  final TextEditingController firstNameSignUpController =
      TextEditingController();

  final TextEditingController lastNameSignUpController =
      TextEditingController();

  final TextEditingController confirmPasswordSignUpController =
      TextEditingController();

  TextEditingController phoneNumberSignUpController = TextEditingController();

  ///
  /// verify emails focus nodes and controllers
  ///
//
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  final List<TextEditingController> listOfControllers =
      List.generate(4, (_) => TextEditingController());

  ///
  /// forgetpassword email controller
//

  TextEditingController emailForgetPasswordController = TextEditingController();

  ///
  /// enter code screen to change password
//
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordChangeController = TextEditingController();
  TextEditingController confirmPasswordChangeController =
      TextEditingController();

  ///
  ///
  ///
  /// callling the apis here
  ///
  ///
  ///
//sign in
  final _repository = Repostiory();

  RxString forgetPasswordOtp = "".obs;

  String forgetPasswordOtpFunction() {
    forgetPasswordOtp.value = " ";
    for (int i = 0;
        i < Get.find<AuthController>().listOfControllers.length;
        i++) {
      forgetPasswordOtp.value +=
          Get.find<AuthController>().listOfControllers[i].text.toString();
    }
    return forgetPasswordOtp.value;
  }

  login() async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    await _repository
        .loginRepo(
            email: emailSignInController.text,
            password: passwordSignInController.text,
            deviceToken: "token")
        .then((response) {
      if (response.status == "1") {
        Get.back();

        showCustomToast(response.message.toString(), color: Colors.green);
        passwordSignInController.text = "";
        Get.offAll(() => const FirstHomeScreen());
      } else {
        Get.back();
        showCustomToast(response.message.toString());
      }
    }, onError: (error) {
      log(error);
      if (error.toString().contains("SocketException")) {
        Get.back();
        showCustomToast(
            "No Internet Connection. Please connect your device to the internet");
      } else if (error.toString().contains("Service Unavailable")) {
        Get.back();
        showCustomToast("Server Unavailable");
      } else {
        Get.back();
        showCustomToast("Something Went Wrong. Please Try Again");
      }
    });
  }

  // register / sign up api call

  register() async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    log(emailSignUpController.text.toString());
    FormData formData = FormData({
      "firstName": firstNameSignUpController.text.toString(),
      "lastName": lastNameSignUpController.text.toString(),
      "email": emailSignUpController.text.toString(),
      'password': passwordSignUpController.text.toString(),
      'countryCode': userPhoneNumberCode.value.toString(),
      "phoneNum": phoneNumberSignUpController.text.tr.toString(),
      "gKey": "key",
      "deviceToken": "token"
    });
    await _repository.registerRepo(formData: formData).then((value) {
      if (value.status == "1") {
        Get.back();
        showCustomToast(value.message.toString(), color: Colors.green);
        Get.offAll(() => VerifyEmailScreen());
      } else {
        Get.back();
        showCustomToast(value.message.toString());
      }
    }, onError: (error) {
      if (error.toString().contains("SocketException")) {
        Get.back();
        showCustomToast(
            "No Internet Connection. Please connect your device to the internet");
      } else if (error.toString().contains("Service Unavailable")) {
        showCustomToast("Server Unavailable");
      } else {
        Get.back();
        showCustomToast("Something Went Wrong. Please Try Again");
      }
    });
  }

  ///
  ///
  /// verify email function
  ///

  verifyEmail() async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId").toString();

    await _repository
        .verifyEmailRepo(
            OTP: forgetPasswordOtpFunction(),
            userId: userId,
            deviceToken: "token")
        .then((response) {
      if (response.status == "1") {
        showCustomToast(response.message.toString(), color: Colors.green);
        Get.offAll(() => const FirstHomeScreen());
      } else {
        showCustomToast(response.message.toString());
        Get.back(); // to remove circular progress dialog
      }
    }, onError: (error) {
      if (error.toString().contains("SocketException")) {
        Get.back();
        showCustomToast(
            "No Internet Connection. Please connect your device to the internet");
      } else if (error.toString().contains("Service Unavailable")) {
        showCustomToast("Server Unavailable");
      } else {
        Get.back();
        showCustomToast("Something Went Wrong. Please Try Again");
      }
    });
  }

  ///
  ///
  /// forgot password function api
  ///

  forgotPasswordApi() async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await _repository
        .forgetPasswordRepo(
            email: emailForgetPasswordController.text.toString())
        .then((res) {
      if (res.status == "1") {
        showCustomToast(res.message.toString(), color: Colors.green);
        Get.offAll(() => EnterCodeScreen());
      } else {
        showCustomToast(res.message.toString());
        Get.back();
      }
    }, onError: (error) {
      if (error.toString().contains("SocketException")) {
        showCustomToast("No Internet connection");
        Get.back();
      } else if (error.toString().contains("Service unavailable")) {
        showCustomToast("Server is busy at the moment");
        Get.back();
      } else {
        showCustomToast("Something went wrong");
        Get.back();
      }
    });
  }

  ///
  /// create new password
  ///

  createNewPassword() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId").toString();
    // final f = prefs.getString("userId").toString();
    await _repository
        .createNewPasswordRepo(
            OTP: "3844",
            password: passwordChangeController.text,
            userId: userId,
            forgetRequestId: forgetRequestId.value)
        .then((resp) {
      if (resp.status == "1") {
        showCustomToast(resp.message.toString(), color: Colors.green);
        Get.offAll(() => SignInScreen());
      } else {
        Get.back();
        showCustomToast(resp.message.toString());
      }
    }, onError: (error) {
      if (error.toString().contains("SocketException")) {
        showCustomToast("Internet unavailable");
        Get.back();
      } else if (error.toString().contains("Service unavailable")) {
        showCustomToast("Server is busy at the moment");
        Get.back();
      } else {
        showCustomToast("Something went wrong");
        Get.back();
      }
    });
  }

  ///
  ///Resend email
  ///

  resendEmail() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId").toString();
    // final f = prefs.getString("userId").toString();
    await _repository
        .resendEmailOTPRepo(
            userId: userId,
            email: emailForgetPasswordController.text.toString())
        .then((resp) {
      if (resp.status == "1") {
        showCustomToast(resp.message.toString(), color: Colors.green);
        Get.offAll(() => VerifyEmailScreen());
      } else {
        Get.back();
        showCustomToast(resp.message.toString());
      }
    }, onError: (error) {
      if (error.toString().contains("SocketException")) {
        showCustomToast("Internet unavailable");
        Get.back();
      } else if (error.toString().contains("Service unavailable")) {
        showCustomToast("Server is busy at the moment");
        Get.back();
      } else {
        showCustomToast("Something went wrong");
        Get.back();
      }
    });
  }
}
