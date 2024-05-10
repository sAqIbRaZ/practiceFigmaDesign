class RegisterResponseModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String stripeCustomerId;
  final String customerEphemeralKeySecret;
  final String accessToken;

  RegisterResponseModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.stripeCustomerId,
    required this.customerEphemeralKeySecret,
    required this.accessToken,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        stripeCustomerId: json['stripeCustomerId'],
        customerEphemeralKeySecret: json['customerEphemeralKeySecret'],
        accessToken: json['accessToken']);
  }
}
