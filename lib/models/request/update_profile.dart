class UpdateProfile {
  String country='';
  String city='';
  String industry='';
  String company='';
  String designation='';
  String current_status='';
  String mobile='';
  String user_id = ' ';

  UpdateProfile({
    required this.country,
    required this.city,
    required this.industry,
    required this.company,
    required this.designation,
    required this.current_status,
    required this.mobile,
    required this.user_id,
  });

  UpdateProfile.fromJson(Map<String, String> json) {
    country = json['country'].toString();
    city = json['city'].toString();
    industry = json['industry'].toString();
    company = json['company'].toString();
    designation = json['designation'].toString();
    current_status = json['current_status'].toString();
    mobile = json['mobile'].toString();
    user_id = json['user_id'].toString();
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['industry'] = this.industry;
    data['company'] = this.company;
    data['designation'] = this.designation;
    data['current_status'] = this.current_status;
    data['mobile'] = this.mobile;
    data['user_id'] = this.user_id;
    return data;
  }
}
