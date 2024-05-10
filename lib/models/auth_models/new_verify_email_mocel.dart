class NewVerifyEmailModel {
  String? status;
  String? message;
  Data? data;
  String? error;

  NewVerifyEmailModel({this.status, this.message, this.data, this.error});

  NewVerifyEmailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? accessToken;
  String? stripeCustomerId;
  String? customerEphemeralKeySecret;

  Data(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.accessToken,
      this.stripeCustomerId,
      this.customerEphemeralKeySecret});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    accessToken = json['accessToken'];
    stripeCustomerId = json['stripeCustomerId'];
    customerEphemeralKeySecret = json['customerEphemeralKeySecret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['accessToken'] = this.accessToken;
    data['stripeCustomerId'] = this.stripeCustomerId;
    data['customerEphemeralKeySecret'] = this.customerEphemeralKeySecret;
    return data;
  }
}
