class VerifyEmailModel {
  final String OTP;
  final String userId;
  final String deviceToken;

  VerifyEmailModel({
    required this.OTP,
    required this.userId,
    required this.deviceToken,
  });
}
