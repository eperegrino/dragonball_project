import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail.dart';
import '../models/character.dart';
import '../services/service.dart';

class CharactersListPageCell extends StatelessWidget {
  final AllCharactersResponse model;

  CharactersListPageCell({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => Detail(model, ServiceImpl())));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /*Stack(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                  ),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: model.image ?? "",
                  ),
                ],
              ),*/
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      model.name,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      model.species,
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                CupertinoIcons.right_chevron,
                color: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
