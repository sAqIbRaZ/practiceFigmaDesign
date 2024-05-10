class NewLoginModel {
  String? status;
  String? message;
  Data? data;
  String? error;

  NewLoginModel({this.status, this.message, this.data, this.error});

  NewLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['accessToken'] = accessToken;
    data['stripeCustomerId'] = stripeCustomerId;
    data['customerEphemeralKeySecret'] = customerEphemeralKeySecret;
    return data;
  }
}
