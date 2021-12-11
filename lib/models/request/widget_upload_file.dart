import 'dart:io';

import 'package:http/http.dart' as http;

class UploadFile {
  int project_id=0;
  dynamic more_files;

  UploadFile({required this.project_id, this.more_files});

  UploadFile.fromJson(Map<String, dynamic> json) {
    project_id = json['project_id'];
    more_files = json['more_files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.project_id;
    data['more_files'] = this.more_files;
    return data;
  }
}
