import 'package:dragonball_project/models/character.dart';
import 'package:dragonball_project/services/service.dart';

class CharactersListPageViewModel{
  Service service;
  Function carregarListagem;
  List<AllCharactersResponse> dataSource = [];
  String navigationTitle = "Characters";
  String imageBackground = "images/dbz.png";

  CharactersListPageViewModel({this.service});

  feedDataSource() {
    service.getAllCharacters().then((json) {
      List<AllCharactersResponse> charList = [];

      if (json != null) {
        for(var charJson in json) {
          var charResponse = AllCharactersResponse.fromMappedJson(charJson);

          if(charJson["url"] != null) {
            var split = charJson["url"].toString().split("/");
            split.removeLast();
          }

          charList.add(charResponse);
        }
        dataSource = charList;
        carregarListagem();
      }
    });
  }

}