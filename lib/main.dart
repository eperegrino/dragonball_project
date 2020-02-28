import 'package:dragonball_project/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() => runApp(Dragonball());

class Dragonball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if(Platform.isIOS) { //iOS
      return RunningIOS();
    } else { //Android
      return RunningAndroid();
    }
  }
}

class RunningIOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: TabIOS(),
    );
  }
}

class RunningAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: null,
      ),
    );
  }
}