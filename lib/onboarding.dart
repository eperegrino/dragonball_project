import 'package:dragonball_project/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  String image;
  bool isVisible;
  String text;
  String btnText;
}

enum OnboardingScreens {
  tela1,
  tela2
}

class OnboardingViewModel {
  OnboardingScreens tela;
  OnboardingModel onboardingModel;

  OnboardingViewModel(this.tela) {
    onboardingModel = OnboardingModel();
    switch(this.tela) {
      case OnboardingScreens.tela1:
        onboardingModel.image = "images/dbz1.png";
        onboardingModel.isVisible = false;
        onboardingModel.text = "";
        onboardingModel.btnText = "";
        break;
      case OnboardingScreens.tela2:
        onboardingModel.image = "images/dbz.png";
        onboardingModel.isVisible = true;
        onboardingModel.text = "Oi, eu sou o Goku!";
        onboardingModel.btnText = "Vamos começar!";
        break;
    }
  }

  String getImage() {
    return onboardingModel.image;
  }

  bool isVisible() {
    return onboardingModel.isVisible;
  }

  String getText() {
    return onboardingModel.text;
  }

  String getBtnText() {
    return onboardingModel.btnText;
  }
}

class OnboardingPagination extends StatelessWidget {
  OnboardingViewModel onboardingViewModel1;
  OnboardingViewModel onboardingViewModel2;

  OnboardingPagination() {
    onboardingViewModel1 = OnboardingViewModel(OnboardingScreens.tela1);
    onboardingViewModel2 = OnboardingViewModel(OnboardingScreens.tela2);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(children: <Widget>[
        Onboarding(onboardingViewModel1),
        Onboarding(onboardingViewModel2),
      ],
    );
  }
}

class Onboarding extends StatelessWidget {
  OnboardingViewModel onboardingViewModel;

  Onboarding(this.onboardingViewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          OnboardingBackground(onboardingViewModel.getImage()),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(onboardingViewModel.getText(), style: TextStyle(color: Colors.white, fontSize: 30),),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 70),
                    //   child: Text("Descubra informações dos personagens do mundo de Dragon Ball", style: TextStyle(color: Colors.white, fontSize: 15),),
                    // ),
                    Visibility(
                      visible: onboardingViewModel.isVisible(),
                      child: CupertinoButton(
                        child: Text(onboardingViewModel.getBtnText()),
                        color: Colors.deepOrange,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => TabIOS()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class OnboardingBackground extends StatelessWidget {
  final String backgroundImage;

  OnboardingBackground(this.backgroundImage);

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.contain
              )
            ),
          );
  }
}