class AllCharactersResponse {
  String name;
  String species;
  String image;
  String gender;
  String status;
  String originPlanet;

  AllCharactersResponse.fromMappedJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        gender = json['gender'] ?? "",
        species = json['species'] ?? "",
        status = json['status'] ?? "",
        originPlanet = json['originPlanet'] ?? "";
}