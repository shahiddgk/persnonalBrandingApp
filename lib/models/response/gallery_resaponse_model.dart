class GalleryReadResponse {
  String title = '';
  String body = '';
  List<Images> images = [];

  GalleryReadResponse(
      {required this.title,
        required this.body,
        required this.images,});

  GalleryReadResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
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

class GalleryListResponse {
  List<GalleryReadResponse> galleryList = [];

  GalleryListResponse();

  GalleryListResponse.fromJson(List<dynamic> jsonObject) {
    for (var area in jsonObject) {
      GalleryReadResponse model = GalleryReadResponse.fromJson(area);
      this.galleryList.add(model);
    }
  }
}