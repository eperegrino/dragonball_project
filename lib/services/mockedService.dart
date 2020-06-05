import 'package:http/http.dart' as http;

import './service.dart';

class MockedServiceImpl implements Service {
  @override
  Future<dynamic> getAllCharacters() async {
    // return http.get(formUrl("character"));
    var list = [
        {"name": "Vegeta", "species": "Saiyan"},
        {"name": "Goku", "species": "Saiyan"},
        {"name": "Gohan", "species": "Saiyan"},
        {"name": "Cell", "species": "Android"},
        {"name": "Goten", "species": "Saiyan"},
      ];
      /*name = json['name'] ?? "",
        id = json['_id'] ?? 0,
        image = json['image'] ?? "",
        gender = json['gender'] ?? "",
        status = json['status'] ?? "",
        originPlanet = json['originPlanet'] ?? "";*/

      Map<String, dynamic> json = {"body": list};
      return json;
  }

  @override
  Future<dynamic> getAllPlanets() async {
    // return http.get(formUrl("planet"));
  }

  @override
  Future<http.Response> getCharacterByName(String name) {
    // return http.get(formUrl("character/$name"));
  }

  @override
  String getBaseUrl() {
    // return baseUrl;
    return "https://url_teste_dbz_api";
  }
}