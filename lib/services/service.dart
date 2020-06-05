import 'package:http/http.dart' as http;

import 'dart:convert';

import './base_service.dart';

abstract class Service {
  Future<dynamic> getAllCharacters();
  Future<dynamic> getAllPlanets();
  Future<dynamic> getCharacterByName(String name);
  String getBaseUrl();
}

class ServiceImpl extends BaseService implements Service {
  @override
  Future<dynamic> getAllCharacters() async {
    return await Future<dynamic>(() {
      http.get(formUrl("character")).then((response){
        var json = jsonDecode(response.body);
        return json;
      });
    });
  }

  @override
  Future<dynamic> getAllPlanets() async {
    return await Future<dynamic>(() {
      http.get(formUrl("planet")).then((response) {
        var json = jsonDecode(response.body);
        return json;
      });
    });
    
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