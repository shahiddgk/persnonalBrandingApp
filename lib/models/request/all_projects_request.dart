class AllProjectsListRequest {
  dynamic id = 0;

  AllProjectsListRequest({required this.id,});

  AllProjectsListRequest.fromJson(Map<String, dynamic> json) {
    id = json['userid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.id;
    return data;
  }
}
