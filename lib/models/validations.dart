import '../utils/custom_toast_message.dart';

class Validation {
  ///
  /// validation for registration
  ///
  static bool validateInputFields(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String phoneNumber,
      bool agreeToTerms) {
    if (firstName.isEmpty) {
      showCustomToast('First name is required');
      return false;
    } else if (lastName.isEmpty) {
      showCustomToast('Last name is required');
      return false;
    } else if (email.isEmpty) {
      showCustomToast('Email is required');
      return false;
    } else if (phoneNumber.isEmpty) {
      showCustomToast('Phone number is required');
      return false;
    } else if (password.isEmpty) {
      showCustomToast('password is required');
      return false;
    } else if (confirmPassword.isEmpty) {
      showCustomToast('Confirm password is required');
      return false;
    } else if (password != confirmPassword) {
      showCustomToast('Password do not matched');
      return false;
    } else if (agreeToTerms == false) {
      showCustomToast('Agree to terms and conditions required');
      return false;
    } else {
      return true;
    }
  }
}
