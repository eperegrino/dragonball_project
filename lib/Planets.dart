import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlanetsGrid extends StatelessWidget {
  List<String> dataSource = [];
  List<String> namePlanet = ['Vegeta','Majin','Namek','Earth'];

  PlanetsGrid() {
    List<String> namePlanet = ['Vegeta','Gohan','Goku','Piccolo','Cell','Goten','Krillin'];
    for (var i = 0; i < 7; i++) {
      var nome = namePlanet.elementAt(i);
      dataSource.add("https://dragon-ball-api.herokuapp.com/images/$nome.jpg");
    }
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
          children: dataSource.map((value) {
            return Image.network(value);
          }).toList(),
        ),
      ),
    );
  }
}
