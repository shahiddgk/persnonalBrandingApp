class CareerReadResponse {
  CareerReadResponse({
    required this.companyName,
    required this.profession,
    required this.description,
    required this.duration,
    required this.image,
  });

  String companyName;
  String profession;
  String description;
  String duration;
  String image;

  factory CareerReadResponse.fromJson(Map<String, dynamic> json) => CareerReadResponse(
    companyName: json["company_name"],
    profession: json["profession"],
    description: json["description"],
    duration: json["duration"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "profession": profession,
    "description": description,
    "duration": duration,
    "image": image,
  };
}

class CareerListResponse {
  List<CareerReadResponse> careerList = [];

  CareerListResponse();

  CareerListResponse.fromJson(List<dynamic> jsonObject) {
    for (var area in jsonObject) {
      CareerReadResponse model = CareerReadResponse.fromJson(area);
      this.careerList.add(model);
    }
  }
}
