class FutureGoalsReadResponse {
  String title = '';
  String body = '';
  String cover = '';
  List<Images> images = [];
  String video = '';

  FutureGoalsReadResponse(
      {required this.title,
        required this.body,
        required this.cover,
        required this.images,
        required this.video});

  FutureGoalsReadResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    cover = json['cover'];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['cover'] = this.cover;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['video'] = this.video;
    return data;
  }
}

class Images {
  String img = '';

  Images({required this.img});

  Images.fromJson(Map<String, dynamic> json) {
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    return data;
  }
}

class FutureGoalsListResponse {
  List<FutureGoalsReadResponse> futureGoalsList = [];

  FutureGoalsListResponse();

  FutureGoalsListResponse.fromJson(List<dynamic> jsonObject) {
    for (var area in jsonObject) {
      FutureGoalsReadResponse model = FutureGoalsReadResponse.fromJson(area);
      this.futureGoalsList.add(model);
    }
  }
}