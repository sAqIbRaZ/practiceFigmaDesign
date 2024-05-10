import 'app_images.dart';

class AppConstants {
  static final itemsInBasket = [
    {
      'title': 'Food platter',
      'desc': 'Serving: 6 pieces',
      'price': '2.24 \$',
      'image': AppImages.foodPlatter
    },
    {
      'title': 'Chili wings',
      'desc': 'Serving: 6 pieces',
      'price': '2.24 \$',
      'image': AppImages.chilliWings
    },
    {
      'title': 'Chicken roast',
      'desc': 'Serving: 6 pieces',
      'price': '2.24 \$',
      'image': AppImages.chickenCrispy
    },
  ];

  ///
  /// app base urls and endpoints
  //
  static const String _baseUrl = 'https://demo1.myace.app';
  static String get signInUrl => '$_baseUrl/users/login';
  static String get registerUrl => '$_baseUrl/users/register';
  static String get verifyEmail => '$_baseUrl/users/verifyemail';
  static String get resendOtp => '$_baseUrl/users/resendotp';
  static String get createPassword => '$_baseUrl/users/forgetpasswordresponse';
  static String get forgotPasswordUrl =>
      '$_baseUrl/users/forgetpasswordrequest';
}
