import 'package:dragonball_project/widgets/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import './widgets/onboarding.dart';

void main() => runApp(DragonBall());

class DragonBallModel {
  static bool isIOS = Platform.isIOS;
}

class DragonBallViewModel {
  bool isIOS() {
    return DragonBallModel.isIOS;
  }
}

class DragonBall extends StatelessWidget {
DragonBallViewModel dragonBallViewModel;

DragonBall() {
  dragonBallViewModel = DragonBallViewModel();
}

  @override
  Widget build(BuildContext context) {

    if(dragonBallViewModel.isIOS()) { //iOS
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
      home: OnboardingPagination(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RunningAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: OnboardingPagination(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}