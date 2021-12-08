class AboutReadResponse {
  int id=0;
  String name='';
  String email='';
  String phone='';
  String dob='';
  String address='';
  String nationality='';
  String createdAt='';
  String updatedAt='';
  String statement='';

  AboutReadResponse({required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.address,
    required this.nationality,
    required this.createdAt,
    required this.updatedAt,
    required this.statement});

  AboutReadResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    dob = json['dob'] ?? "";
    address = json['address'] ?? "";
    nationality = json['nationality'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    statement = json['statement'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['nationality'] = this.nationality;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['statement'] = this.statement;
    return data;
  }
}
