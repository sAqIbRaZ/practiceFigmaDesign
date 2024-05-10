import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/auth_models/login_model.dart';
import 'package:food_delivery_app/models/auth_models/new_login_model.dart';
import 'package:get/get.dart';

import '../../models/auth_models/new_create_new_passswrod_modle.dart';
import '../../models/auth_models/new_forget_password_model.dart';
import '../../models/auth_models/new_resend_email.dart';
import '../../models/auth_models/new_signup_model.dart';
import '../../models/auth_models/new_verify_email_mocel.dart';
import '../../utils/constants.dart';

class APIProvider extends GetConnect {
  // login function

  Future<NewLoginModel> login({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    NewLoginModel? model;
    try {
      var response = await post(AppConstants.signInUrl, {
        "email": email,
        "password": password,
        "deviceToken": deviceToken,
      });
      if (response.hasError) {
        return Future.error(response.statusText!); //
      } else {
        debugPrint(
            "Api response ${AppConstants.signInUrl} => ${response.body}");
        model = NewLoginModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      throw Exception(model?.error ?? "Something went wrong");
    }
  }

  ///signup funciton
//

  Future<SignUpModel> register({required FormData formData}) async {
    SignUpModel? model;
    try {
      var response = await post(AppConstants.registerUrl, formData,
          headers: {"Accept": "application/json"});
      if (response.hasError) {
        return Future.error(response.statusText!);
      } else {
        debugPrint(
            "Api response ${AppConstants.registerUrl} => ${response.body}");
        model = SignUpModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      throw Exception(model!.error);
    }
  }

  ///
  /// verify email function
  ///

  Future<NewVerifyEmailModel> verifyEmail(
      {required String OTP,
      required String userId,
      required String deviceToken}) async {
    final model = NewVerifyEmailModel();
    try {
      final response = await post(AppConstants.verifyEmail, {
        'OTP': OTP.toString(),
        'userId': userId.toString(),
        'deviceToken': deviceToken
      });

      if (response.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        final model = NewVerifyEmailModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      throw Exception(model.error);
    }
  }

  ///
  ///
  ///
  Future<NewForgetPasswordRequestModel> forgotPassword({
    required String email,
  }) async {
    var model = NewForgetPasswordRequestModel();

    try {
      final response =
          await post(AppConstants.forgotPasswordUrl, {"email": email});

      if (response.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        model = NewForgetPasswordRequestModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      throw Exception(model!.error);
    }
  }

  ///
  ///
  /// create new password function
  ///

  Future<NewCreatePasswordModel> createNewPassword(
      {required String OTP,
      required String password,
      required String userId,
      required String forgetRequestId}) async {
    var model = NewCreatePasswordModel();

    try {
      final response = await post(AppConstants.createPassword, {
        "OTP": OTP,
        "password": password,
        "userId": userId,
        "forgetRequestId": forgetRequestId
      });

      if (response.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        model = NewCreatePasswordModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      throw Exception(model.error);
    }
  }

  ///
  ///
  /// Resend email api call
  ///

  Future<NewResendEmail> newResendEmail(
      {required String userId, required String email}) async {
    var model = NewResendEmail();

    try {
      final response = await post(
          AppConstants.createPassword, {"userId": userId, "email": email});

      if (response.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        model = NewResendEmail.fromJson(response.body);
        return model;
      }
    } catch (e) {
      throw Exception(model.error);
    }
  }
}
