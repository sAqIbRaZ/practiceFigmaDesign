class RegisterUserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String countryCode;
  final String phoneNum;
  final String gKey;
  final String deviceToken;

  RegisterUserModel(
      {required this.deviceToken,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.countryCode,
      required this.phoneNum,
      required this.gKey});
}
