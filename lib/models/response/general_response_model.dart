class GeneralResponseModel {
  bool status = false;
  String message = '';
  dynamic data;
  dynamic token;

  GeneralResponseModel({required this.status, required this.message, this.data,this.token});

  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['message'];
    data = json['user'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['user'] = this.data;
    data['token'] = this.token;
    return data;
  }
}