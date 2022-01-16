class SocialLoginRequest {
  String name = '';
  String email='';
  String id = '';
  String provider ='';
 // String token = '';

  SocialLoginRequest({required this.name,required this.email, required this.id,required this.provider});

  SocialLoginRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    //token = json['access_token'];
    provider = json['provider'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    //data['access_token'] = this.token;
    data['provider'] = this.provider;

    return data;
  }
}
