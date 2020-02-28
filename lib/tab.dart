
import 'package:dragonball_project/Planets.dart';
import 'package:dragonball_project/characters.dart';
import 'package:dragonball_project/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabIOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark),
              title: Text("Characters")
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              title: Text("Planets")
            ),
          ]
        ),
        tabBuilder: ( BuildContext context, int index) {
          switch(index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => CharactersListPage(ServiceImpl()),
              );
            case 1: return CupertinoTabView(
              builder: (BuildContext context) => PlanetsGrid(),
            );
            default: return null;
          }
        },
      );
  }
}