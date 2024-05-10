import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_models/register_response_model.dart';
import '../models/auth_models/register_user_model.dart';

class HelperFunctions {
  ///
  ///
  /// retrieve users data
  ///
//
  Future<RegisterUserModel> retrieveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final firstName = prefs.getString('firstName');
    final lastName = prefs.getString('lastName');
    final email = prefs.getString('email');
    final password =
        prefs.getString('password'); // Consider security implications
    final countryCode = prefs.getString('countryCode');
    final phoneNum = prefs.getString('phoneNum');
    final gKey = prefs.getString('gKey'); // Not recommended to retrieve

    // Consider using null checks for optional fields or default values.
    return RegisterUserModel(
        firstName: firstName.toString(),
        lastName: lastName.toString(),
        email: email.toString(),
        password: password.toString(),
        countryCode: countryCode.toString(),
        phoneNum: phoneNum.toString(),
        gKey: gKey.toString(),
        deviceToken: 'token' // Don't retrieve sensitive data
        );
  }

  ///
  /// save users data to local storage
  ///RegisterResponseModel userData
  //

  ///
  ///
  /// store users data
  ///
  static Future<void> storeUserData(
      RegisterResponseModel user, String userPassword) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', user.firstName);
    prefs.setString('password', userPassword);
    prefs.setString('lastName', user.lastName);
    prefs.setString('userId', user.userId);
    prefs.setString('email', user.email);
    prefs.setString('accessToken', user.accessToken);
    prefs.setString(
        'customerEphemeralKeySecret', user.customerEphemeralKeySecret);
    prefs.setString('stripeCustomerId', user.stripeCustomerId);
  }

  ///
  ///
  ///
}
