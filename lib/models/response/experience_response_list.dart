class ExperienceReadResponse {
  ExperienceReadResponse({
    required this.companyName,
    required this.profession,
    required this.duration,
    required this.description,
    required this.image,
  });

  String companyName;
  String profession;
  String duration;
  String description;
  String image;

  factory ExperienceReadResponse.fromJson(Map<String, dynamic> json) => ExperienceReadResponse(
    companyName: json["company_name"],
    profession: json["profession"],
    duration: json["duration"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "profession": profession,
    "duration": duration,
    "description": description,
    "image": image,
  };
}

class ExperienceListResponse {
  List<ExperienceReadResponse> experienceList = [];

  ExperienceListResponse();

  ExperienceListResponse.fromJson(List<dynamic> jsonObject) {
    for (var area in jsonObject) {
     ExperienceReadResponse model = ExperienceReadResponse.fromJson(area);
      this.experienceList.add(model);
    }
  }
}
