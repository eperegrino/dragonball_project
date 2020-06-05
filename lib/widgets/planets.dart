import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlanetsModel {
  static List<String> dataSource;
  static List<String> namePlanet;
}

class PlanetsViewModel {
  List<String> dataSource = PlanetsModel.dataSource;
  List<String> namePlanet = PlanetsModel.namePlanet;

  PlanetsViewModel(){
    namePlanet = ['Vegeta','Gohan','Goku','Piccolo','Cell','Goten','Krillin','Earth'];
    dataSource = [];
    for (var i = 0; i < 8; i++) {
      var nome = namePlanet.elementAt(i);
      dataSource.add("https://dragon-ball-api.herokuapp.com/images/$nome.jpg");
    }
  }

}

class PlanetsGrid extends StatelessWidget {
  PlanetsViewModel planetsViewModel;

  PlanetsGrid(){
    planetsViewModel = PlanetsViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "PLANETS",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      child: Container(
        color: Colors.blueGrey.withOpacity(0.8),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: EdgeInsets.all(8),
          children: planetsViewModel.dataSource.map((value) {
            return Image.network(value);
          }).toList(),
        ),
      ),
    );
  }
}
