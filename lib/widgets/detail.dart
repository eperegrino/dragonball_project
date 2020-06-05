import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/character.dart';
import '../services/service.dart';

class Detail extends StatefulWidget {
  final AllCharactersResponse model;
  Service service = ServiceImpl();

  Detail([this.model, this.service]);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  CharReponse charResponseModel;

  @override
  void initState() {
    super.initState();
    _getCharacterWithName();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.model.name),
        ),
        child: charResponseModel != null
            ? Padding(
                padding: EdgeInsets.only(top: 100, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Image.network(widget.service
                    //     .imageNameForID(id: "${charResponseModel.id}")),
                    Center(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: "${widget.service.getBaseUrl()}${charResponseModel.image}" ?? "",
                      ),
                    ),
                  Text("ID: ${charResponseModel.id}"),
                  Text("Name: ${charResponseModel.name}"),
                  Text("Gender: ${charResponseModel.gender}"),
                  Text("Status: ${charResponseModel.status}"),
                  Text("Origin Planet: ${charResponseModel.originPlanet}"),
                  ],
                ))
            : Container(
                child: Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                  ),
                ),
              ));
  }

  _getCharacterWithName() {
    widget.service
        .getCharacterByName(widget.model.name)
        .then((response) {
      var json = jsonDecode(response.body);
      var model = CharReponse.fromMappedJson(json);

      setState(() {
        charResponseModel = model;
      });
    });
  }
}

class CharReponse {
  String name;
  String id;
  String image;
  String gender;
  String status;
  String originPlanet;

  CharReponse.fromMappedJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        id = json['_id'] ?? 0,
        image = json['image'] ?? "",
        gender = json['gender'] ?? "",
        status = json['status'] ?? "",
        originPlanet = json['originPlanet'] ?? "";
}
