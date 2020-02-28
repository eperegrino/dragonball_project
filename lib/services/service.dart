import 'package:http/http.dart' as http;

class BaseService {
  String baseUrl = "https://dragon-ball-api.herokuapp.com/api/";

  String formUrl(String endpoint) {
    return "$baseUrl$endpoint";
  }
}

abstract class Service {
  Future<http.Response> getAllCharacters();
  Future<http.Response> getAllPlanets();
  Future<http.Response> getCharacterByName(String name);
  String getBaseUrl();
}

class ServiceImpl extends BaseService implements Service {
  @override
  Future<http.Response> getAllCharacters() {
    return http.get(formUrl("character"));
  }

  @override
  Future<http.Response> getAllPlanets() {
    return http.get(formUrl("planet"));
  }

  @override
  Future<http.Response> getCharacterByName(String name) {
    return http.get(formUrl("character/$name"));
  }

  @override
  String getBaseUrl() {
    return baseUrl;
  }
}