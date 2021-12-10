class SaveStartUpReadResponse {
  SaveStartUpReadResponse({
    required this.title,
    required this.industry,
    required this.message,
    required this.date,
    required this.purpose,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String title = '';
  String industry = '';
  String message = '';
  String date = '';
  String purpose = '';
  String userId = '';
  String updatedAt = '';
  String createdAt = '';
  int id = 0;

  SaveStartUpReadResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    industry = json['industry'] ?? "";
    message = json['message'] ?? "";
    date = json['date'] ?? "";
    purpose = json['purpose'] ?? "";
    userId = json['user_id'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    id = json['id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['industry'] = this.industry;
    data['message'] = this.message;
    data['date'] = this.date;
    data['purpose'] = this.purpose;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }

}
