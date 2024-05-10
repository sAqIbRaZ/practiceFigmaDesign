import 'package:food_delivery_app/models/auth_models/new_login_model.dart';
import 'package:food_delivery_app/models/auth_models/new_resend_email.dart';
import 'package:get/get.dart';

import '../models/auth_models/new_create_new_passswrod_modle.dart';
import '../models/auth_models/new_forget_password_model.dart';
import '../models/auth_models/new_signup_model.dart';
import '../models/auth_models/new_verify_email_mocel.dart';
import 'api_provider/api_provider.dart';

class Repostiory {
  final _apiProvider = APIProvider();

  ///
  ///
  /// login repo

  Future<NewLoginModel> loginRepo({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    return await _apiProvider.login(
        email: email, password: password, deviceToken: deviceToken);
  }

  ///
  /// register repo
  ///

  Future<SignUpModel> registerRepo({required FormData formData}) async {
    return await _apiProvider.register(
      formData: formData,
    );
  }

  ///
  /// verify email function
  ///

  Future<NewVerifyEmailModel> verifyEmailRepo({
    required String OTP,
    required String userId,
    required String deviceToken,
  }) async {
    return await _apiProvider.verifyEmail(
        OTP: OTP, userId: userId, deviceToken: deviceToken);
  }

  ///
  /// forgetpassword function repo
  ///
  Future<NewForgetPasswordRequestModel> forgetPasswordRepo(
      {required String email}) async {
    return await _apiProvider.forgotPassword(email: email);
  }

  ///
  /// create new password repo
  ///

  Future<NewCreatePasswordModel> createNewPasswordRepo(
      {required String OTP,
      required String password,
      required String userId,
      required String forgetRequestId}) async {
    return _apiProvider.createNewPassword(
        OTP: OTP,
        password: password,
        userId: userId,
        forgetRequestId: forgetRequestId);
  }

  Future<NewResendEmail> resendEmailOTPRepo(
      {required String userId, required String email}) async {
    return _apiProvider.newResendEmail(userId: userId, email: email);
  }
}
