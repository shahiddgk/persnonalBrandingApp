class StartUpRequest {
  int id=0;

  StartUpRequest({required this.id});

  StartUpRequest.fromJson(Map<String, dynamic> json) {
    id = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.id;
    return data;
  }
}
