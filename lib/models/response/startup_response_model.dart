import 'package:personal_branding/widgets/widget_testimonial_picture_details.dart';

class StartUpReadResponse {
  int id = 0;
  int user_id = 0;
  String title = '';
  String industry = '';
  String message = '';
  String Date = '';
  String purpose = '';
  String created_at = '';
  String updated_at = '';
  List<PartnerFiles> partnerFiles = [];

  StartUpReadResponse(
      {
        required this.id,
        required this.user_id,
        required this.title,
        required this.industry,
        required this.message,
        required this.Date,
        required this.purpose,
        required this.created_at,
        required this.updated_at,
        required this.partnerFiles,
      });

  StartUpReadResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    title = json['title'];
    industry = json['industry'];
    message = json['message'];
    Date = json['date'];
    purpose = json['purpose'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    if (json['partnerfiles'] != null) {
      json['partnerfiles'].forEach((v) {
        partnerFiles.add(new PartnerFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['title'] = this.title;
    data['industry'] = this.industry;
    data['message'] = this.message;
    data['date'] = this.Date;
    data['purpose'] = this.purpose;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    if (this.partnerFiles != null) {
      data['partnerfiles'] = this.partnerFiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnerFiles {
  int id = 0;
  String fileInput = '';
  int Partnershipid = 0;
  String created_at = '';
  String updated_at = '';

  PartnerFiles({required this.id,required this.fileInput,required this.Partnershipid});

  PartnerFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileInput = json['fileinput'];
    Partnershipid = json['partnership_id'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileinput'] = this.fileInput;
    data['partnership_id'] = this.Partnershipid;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}

class StartUpListResponse {
  List<StartUpReadResponse> startUpList = [];

  StartUpListResponse();

  StartUpListResponse.fromJson(List<dynamic> jsonObject) {
    for (var area in jsonObject) {
      StartUpReadResponse model = StartUpReadResponse.fromJson(area);
      this.startUpList.add(model);
    }
  }
}
