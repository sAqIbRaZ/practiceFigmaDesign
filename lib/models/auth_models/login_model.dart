class SignInModel {
  final String email;
  final String password;
  final String deviceToken;

  SignInModel({
    required this.email,
    required this.password,
    required this.deviceToken,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
        email: json['email'],
        password: json['password'],
        deviceToken: json['deviceToken']);
  }
}
