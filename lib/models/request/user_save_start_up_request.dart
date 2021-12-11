
class SaveStartUpRequest {

  String title = '';
  String industry = '';
  String message = '';
  String date = '';
  String purpose = '';
  String userid = '';

  SaveStartUpRequest({required this.title,required this.industry,required this.message,required this.date,required this.purpose,required this.userid});

  SaveStartUpRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    industry = json['industry'];
    message = json['message'];
    date = json['date'];
    purpose = json['purpose'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['industry'] = this.industry;
    data['message'] = this.message;
    data['date'] = this.date;
    data['purpose'] = this.purpose;
    data['userid'] = this.userid;
    return data;
  }
}
