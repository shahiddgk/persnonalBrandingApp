class UserProfileData {

  String country = '';
  String city = '';
  String industry = '';
  String company = '';
  String designation = '';
  String current_status = '';
  int mobile = 0;
  int landline = 0;
  String profile_image = '';

  UserProfileData(
      {required this.country,
        required this.city,
        required this.industry,
        required this.company,
        required this.designation,
        required this.current_status,
        required this.mobile,
        required this.landline,
        required this.profile_image});

  UserProfileData.fromJson(Map<String, dynamic> json) {
    country = json['country']??'';
    city = json['city']??'';
    industry = json['industry']??'';
    company = json['company']??'';
    designation = json['designation']??'';
    current_status = json['current_status']??'';
    mobile = json['mobile']??0;
    landline = json['landline']??0;
    profile_image = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['industry'] = this.industry;
    data['company'] = this.company;
    data['designation'] = this.designation;
    data['current_status'] = this.current_status;
    data['mobile'] = this.mobile;
    data['landline'] = this.landline;
    data['profile_image'] = this.profile_image;
    return data;
  }
}
