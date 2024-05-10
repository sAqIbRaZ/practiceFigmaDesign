class CreatePasswordModel {
  final String OTP;
  final String password;
  final String userId;
  final String forgetRequestId;

  CreatePasswordModel({
    required this.OTP,
    required this.password,
    required this.userId,
    required this.forgetRequestId,
  });
}
