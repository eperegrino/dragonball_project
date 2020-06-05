class AllPlanetsResponse {
  String residents;
  String name;
  String url;
  String image;

  AllPlanetsResponse.fromMappedJson(Map<String, dynamic> json)
      : residents = json['residents'] ?? "",
        name = json['name'] ?? "",
        url = json['url'] ?? "",
        image = json['image'] ?? "";
}