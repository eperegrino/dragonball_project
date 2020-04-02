
import 'package:dragonball_project/Planets.dart';
import 'package:dragonball_project/characters.dart';
import 'package:dragonball_project/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabModel {
  static String chars = "Characters";
  static IconData charsIcon = CupertinoIcons.bookmark;
  static String planets = "Planets";
  static IconData planetsIcon = CupertinoIcons.bell;
}

class TabViewModel {
  String chars = TabModel.chars;
  IconData charsIcon = TabModel.charsIcon;
  String planets = TabModel.planets;
  IconData planetsIcon = TabModel.planetsIcon;
}

class TabIOS extends StatelessWidget {
  TabViewModel tabViewModel;

  TabIOS() {
    tabViewModel = TabViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(tabViewModel.charsIcon),
              title: Text(tabViewModel.chars)
            ),
            BottomNavigationBarItem(
              icon: Icon(tabViewModel.planetsIcon),
              title: Text(tabViewModel.planets)
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