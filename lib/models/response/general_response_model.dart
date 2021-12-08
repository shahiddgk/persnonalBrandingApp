class GeneralResponseModel {
  bool status = false;
  String message = '';
  dynamic data;
  dynamic user;
  dynamic token;

  GeneralResponseModel({required this.status, required this.message, this.user,this.data,this.token});

  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['message'];
    data = json['data'];
    user = json['user'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['user'] = this.user;
    data['token'] = this.token;
    return data;
  }
}