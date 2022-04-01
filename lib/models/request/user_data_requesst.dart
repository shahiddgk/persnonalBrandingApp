class UserDataRequest {
  String user_id='';

  UserDataRequest({required this.user_id,});

  UserDataRequest.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    return data;
  }
}
