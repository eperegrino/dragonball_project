import 'package:dragonball_project/models/planet.dart';
import 'package:dragonball_project/services/service.dart';

class PlanetsListPageViewModel {
  Service service;
  List<String> dataSource = [];
  String navigationTitle;
  Function carregarListagem;

  PlanetsListPageViewModel({this.service});

  feedDataSource() {
    service.getAllPlanets().then((json) {
      List<String> charList = [];
      if(json!=null){
        for(var charJson in json){
          var charResponse = AllPlanetsResponse.fromMappedJson(charJson);
          charList.add("${service.getBaseUrl()}${charResponse.image}" ?? "");
        }
        dataSource = charList;
        carregarListagem();
      }
    });
  }

}