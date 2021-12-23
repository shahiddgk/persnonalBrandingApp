import 'package:personal_branding/widgets/widget_testimonial_picture_details.dart';

class StartUpReadResponse {
  int id = 0;
  String title = '';
  String industry = '';
  String message = '';
  List<PartnerFiles> partnerFiles = [];
  String date = '';
  String purpose = '';

  StartUpReadResponse(
      {
        required this.id,
        required this.title,
        required this.industry,
        required this.message,
        required this.date,
        required this.purpose,
        required this.partnerFiles,
      });

  StartUpReadResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? '' : json['id'];
    title = json['title'] == null ? '' : json['title'];
    industry = json['industry'] == null ? '' : json['industry'];
    message = json['message'] == null ? '' : json['message'];
    date = json['date'] == null ? '' : json['date'];
    purpose = json['purpose'] == null ? '' : json['purpose'];
    if (json['files'] != null) {
      json['files'].forEach((v) {
        partnerFiles.add(new PartnerFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['industry'] = this.industry;
    data['message'] = this.message;
    data['date'] = this.date;
    data['purpose'] = this.purpose;
    if (this.partnerFiles != null) {
      data['files'] = this.partnerFiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnerFiles {

  String fileInput = '';
  String image = '';


  PartnerFiles({required this.fileInput,required this.image});

  PartnerFiles.fromJson(Map<String, dynamic> json) {

    fileInput = json['filename'];
    image = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['filename'] = this.fileInput;
    data['img'] = this.image;

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
