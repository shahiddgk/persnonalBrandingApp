class SessionUserModel {
  int id = 0;
  String name = '';
  String email = '';
  String usertype = '';
  String createdAt = '';
  String updatedAt = '';
  String status = '';
  String token = '';

  SessionUserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.usertype,
      required this.createdAt,
      required this.updatedAt,
      required this.status,
      required this.token});

  SessionUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    usertype = json['usertype'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['usertype'] = this.usertype;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['token'] = this.token;
    return data;
  }
}
