import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../characters_view_model.dart';
import './characters_cell.dart';

class CharactersListPage extends StatefulWidget {
  final CharactersListPageViewModel viewModel;

  CharactersListPage({this.viewModel});

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {

  CharactersListPageViewModel _viewModel;
  
  @override
  initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.carregarListagem = () {setState(() {});};
    _viewModel.feedDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          _viewModel.navigationTitle,
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
                      image: AssetImage(_viewModel.imageBackground), fit: BoxFit.fitWidth)),
              child: null,
            ),
            Container(
              color: Colors.white.withOpacity(0.7),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _viewModel.dataSource.isNotEmpty
                ? ListView(
                  children: _viewModel.dataSource.map((character) {
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

  
}