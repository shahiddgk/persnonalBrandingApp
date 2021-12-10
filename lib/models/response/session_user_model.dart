class SessionUserModel {
  int id=0;
  String name='';
  String email='';
  String usertype='';
  String emailVerifiedAt='';
  String createdAt='';
  String updatedAt='';
  String status = '';

  SessionUserModel(
      {required this.id,
        required this.name,
        required this.email,
        required this.usertype,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
      required this.status});

  SessionUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? 0 : json['id'];
    name = json['name'] == null ? "" : json['name'];
    email = json['email'] == null ? "" : json['email'];
    usertype = json['usertype'] == null ? "" : json['usertype'];
    emailVerifiedAt = json['email_verified_at'] == null ? "" : json['email_verified_at'];
    createdAt = json['created_at'] == null ? "" : json['created_at'];
    updatedAt = json['updated_at'] == null ? "" : json['updated_at'];
    status = json['status'] == null ? "" : json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['usertype'] = this.usertype;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }
}
