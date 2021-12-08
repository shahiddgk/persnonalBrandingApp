class TestimonialsReadResponse {
  TestimonialsReadResponse({
    required this.companyName,
    required this.profession,
    required this.description,
    required this.image,
  });

  String companyName;
  String profession;
  String description;
  String image;

  factory TestimonialsReadResponse.fromJson(Map<String, dynamic> json) => TestimonialsReadResponse(
    companyName: json["company_name"],
    profession: json["profession"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "profession": profession,
    "description": description,
    "image": image,
  };
}
