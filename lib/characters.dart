import 'dart:convert';

import 'package:dragonball_project/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dragonball_project/services/service.dart';

import 'characters_cell.dart';

class CharactersListPage extends StatefulWidget {
  Service service = ServiceImpl();

  CharactersListPage([this.service]);

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class CharactersListPageModel{
  static List<AllCharactersResponse> dataSource;
}

class CharactersListPageViewModel{
  List<AllCharactersResponse> dataSource = CharactersListPageModel.dataSource;
  Function carregarListagem;

  CharactersListPageViewModel(this.carregarListagem){
    dataSource = [];
  }
}

class _CharactersListPageState extends State<CharactersListPage> {
  CharactersListPageViewModel charactersListPageViewModel;

  _CharactersListPageState(){
    charactersListPageViewModel = CharactersListPageViewModel((){
      _feedDataSource();
    });
  }

  @override
  initState() {
    super.initState();
    charactersListPageViewModel.carregarListagem();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Characters",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightBlue.withOpacity(0.2),
      ),
      child: Container(
        color: Colors.lightBlue.withOpacity(0.5),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/dbz.png"), fit: BoxFit.fitWidth)),
              child: null,
            ),
            Container(
              color: Colors.white.withOpacity(0.7),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: charactersListPageViewModel.dataSource.isNotEmpty
                ? ListView(
                  children: charactersListPageViewModel.dataSource.map((character) {
                    return Container(
                      height: 50,
                      child: CharactersListPageCell(
                        model: character
                      ),
                    );
                  }).toList()
                ) : Container(),
            ),
          ],
        )
      )
    );
  }

  _feedDataSource() {
    widget.service.getAllCharacters().then((response) {
      var json = jsonDecode(response.body);
      List<AllCharactersResponse> charList = [];

      if (json != null) {
        for(var charJson in json) {
          var charResponse = AllCharactersResponse.fromMappedJson(charJson);

          if(charJson["url"] != null) {
            var split = charJson["url"].toString().split("/");
            split.removeLast();

            var id = split.last;
            // charResponse.image = widget.service.
          }

          charList.add(charResponse);
        }

        setState(() {
          charactersListPageViewModel.dataSource = charList;
        });
      }
    });
  }
}