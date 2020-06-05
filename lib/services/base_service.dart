class BaseService {
  String baseUrl = "https://dragon-ball-api.herokuapp.com/api/";

  String formUrl(String endpoint) {
    return "$baseUrl$endpoint";
  }
}
