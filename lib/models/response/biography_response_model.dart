class BiographyReadResponse {
  BiographyReadResponse({
    required this.title,
    required this.body,
    required this.cover,
    required this.images,
    required this.video,
  });

  String title;
  String body;
  String cover;
  List<Image> images;
  String video;

  factory BiographyReadResponse.fromJson(Map<String, dynamic> json) => BiographyReadResponse(
    title: json["title"] ?? '',
    body: json["body"] ?? '',
    cover: json["cover"] ?? '',
    images: List<Image>.from(json["images"]==[] ? [{"img": " "}] : json["images"].map((x) => Image.fromJson(x)) ),
    video: json["video"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "cover": cover,
    "images": List<Image>.from(images.map((x) => x.toJson())),
    "video": video,
  };
}

class Image {
  Image({
    required this.img,
  });

  String img;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    img: json["img"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "img": img,
  };
}