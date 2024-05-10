import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery_app/models/auth_models/verify_email_model.dart';
import 'package:food_delivery_app/models/auth_models/create_password_model.dart';
import 'package:food_delivery_app/models/auth_models/login_model.dart';
import 'package:food_delivery_app/models/auth_models/resend_otp_model.dart';
import 'package:food_delivery_app/utils/custom_toast_message.dart';
import 'package:food_delivery_app/utils/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../utils/constants.dart';
import 'auth_models/register_response_model.dart';
import 'auth_models/register_user_model.dart';

class APIServices extends GetConnect {
  ///
  ///
  /// register user
  ///
  Future<bool> registerUser(RegisterUserModel user) async {
    final Map<String, String> requestBody = {
      "firstName": user.firstName.toString(),
      "lastName": user.lastName.toString(),
      "email": user.email.toString(),
      'password': user.password.toString(),
      'countryCode': user.countryCode.toString(),
      "phoneNum": user.phoneNum.toString(),
      "gKey": user.gKey.toString(),
      "deviceToken": user.deviceToken.toString()
    };
    try {
      final response = await post(
          AppConstants.registerUrl, jsonEncode(requestBody),
          headers: {'Accept': 'application/json'});
      final data = response.body;
      print(response.body);
      if (data != null &&
          data['message'].toString() ==
              'WHERE parameter "email" has invalid "undefined" value') {
        showCustomToast('Email is invalid');
        // print(data['message']);
        return false;
      } else if (data != null && data['message'] == 'Users exists') {
        showCustomToast(data['error']);
        return false;
      } else if (data['status'] == "1" && data != null) {
        showCustomToast(data['message']);

        final userData = RegisterResponseModel.fromJson(data['data']);

        /// storing user data in local storage

        HelperFunctions.storeUserData(userData, user.password);

        return true;
      } else if (data != null &&
          data['message'].toString().trim() ==
              "Error in creating stripe customer") {
        showCustomToast('Email or Phone Number is invalid');
        return false;
      } else {
        print(data != null && data['message']);
        showCustomToast(data['message']);
        return false;
      }
    } catch (e) {
      print('😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀$e');

      showCustomToast(e.toString());
      return false;
    }
  }

  ///
  ///
  /// verifyUser email
  ///

  Future<bool> verifyEmailApi(VerifyEmailModel verifyEmailmodel) async {
    // print(verifyEmailmodel.OTP);
    // print(verifyEmailmodel.userId);

    // print(verifyEmailmodel.deviceToken);

    final Map<String, String> requestBody = {
      "OTP": verifyEmailmodel.OTP,
      "userId": verifyEmailmodel.userId,
      "deviceToken": "token",
    };
    try {
      final response =
          await post(AppConstants.verifyEmail, jsonEncode(requestBody));

      final data = response.body;

      print(data);
      if (data['status'] == "1") {
        showCustomToast(data['message']);
        return true;
      } else if (data['message'] == 'Verification failed') {
        showCustomToast(data['error']);
        return false;
      }
      return true;
    } catch (e) {
      print(e.toString());
      showCustomToast(e.toString());
      return false;
    }
  }

  ///
  ///
  /// resend otp
//

  Future<bool> resendOtpApi(ResendOtpModel data) async {
    final Map<String, String> requestBody = {
      "email": data.email,
      "userId": data.userId,
    };
    try {
      final response =
          await post(AppConstants.resendOtp, jsonEncode(requestBody));

      final data = response.body;

      print(data);
      if (data['status'] == "1") {
        showCustomToast(data['message']);
        return true;
      } else {
        showCustomToast(data['something went wrong']);
        return false;
      }
    } catch (e) {
      log(e.toString());
      showCustomToast(e.toString());
      return false;
    }
  }

  ///
  ///
  /// Sign in  user
  ///
  Future<bool> signInUserApi(SignInModel user) async {
    final Map<String, String> requestBody = {
      "email": user.email.toString(),
      'password': user.password.toString(),
      "deviceToken": user.deviceToken.toString()
    };
    try {
      final response = await post(
          AppConstants.signInUrl, jsonEncode(requestBody),
          headers: {'Accept': 'application/json'});
      final data = response.body;
      print('body of the response is😀😀😀');
      print(response.body);

      if (data != null && data['status'].toString() == '0') {
        showCustomToast(data['message']);
        // print(data['message']);
        return false;
      } else if (data['status'] == "1" && data != null) {
        showCustomToast(data['message']);

        final userData = RegisterResponseModel.fromJson(data['data']);

        /// storing user data in local storage

        HelperFunctions.storeUserData(userData, user.password);

        return true;
      } else if (data != null && data['status'] == '2') {
        showCustomToast(data['message']);
        return false;
      } else {
        print(data);
        showCustomToast(data['message']);
        return false;
      }
    } catch (e) {
      print('😀😀😀$e');

      showCustomToast(e.toString());
      return false;
    }
  }

  ///
  ///
  /// forgot passsword api to send email verification
  ///
  Future<String> forgotPasswordApi(String email) async {
    final Map<String, String> requestBody = {
      "email": email,
    };
    try {
      final response = await post(
          AppConstants.forgotPasswordUrl, jsonEncode(requestBody),
          headers: {'Accept': 'application/json'});
      final data = response.body;
      print(response.body);

      if (data != null && data['status'].toString() == '0') {
        showCustomToast(data['message']);
        // print(data['message']);
        return '';
      } else if (data['status'] == "1" && data != null) {
        showCustomToast(data['message']);

        return data['data']['forgetRequestId'];
      } else if (data != null && data['status'] == '2') {
        showCustomToast(data['message']);
        return '';
      } else {
        print(data);
        showCustomToast(data['message']);
        return '';
      }
    } catch (e) {
      print('😀😀😀$e');

      showCustomToast(e.toString());
      return '';
    }
  }

  ///
  ///
  /// create new password and verify otp
  ///
  Future<bool> createNewPasswordApi(CreatePasswordModel model) async {
    final Map<String, String> requestBody = {
      "OTP": model.OTP,
      "password": model.password,
      "userId": model.userId,
      "forgetRequestId": model.forgetRequestId,
    };
    try {
      final response = await post(
          AppConstants.createPassword, jsonEncode(requestBody),
          headers: {'Accept': 'application/json'});
      final data = response.body;
      print(response.body);

      if (data != null && data['status'].toString() == '0') {
        showCustomToast(data['message']);
        // print(data['message']);
        return false;
      } else if (data['status'] == "1" && data != null) {
        showCustomToast(data['message']);

        return true;
      } else if (data != null && data['status'] == '2') {
        showCustomToast(data['message']);
        return false;
      } else {
        print(data);
        showCustomToast(data['message']);
        return false;
      }
    } catch (e) {
      print('😀😀😀$e');

      showCustomToast(e.toString());
      return false;
    }
  }
}
