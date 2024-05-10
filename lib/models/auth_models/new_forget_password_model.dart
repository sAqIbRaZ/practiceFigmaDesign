class NewForgetPasswordRequestModel {
  String? status;
  String? message;
  Data? data;
  String? error;

  NewForgetPasswordRequestModel(
      {this.status, this.message, this.data, this.error});

  NewForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
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
  String? forgetRequestId;

  Data({this.userId, this.forgetRequestId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    forgetRequestId = json['forgetRequestId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['forgetRequestId'] = this.forgetRequestId;
    return data;
  }
}
