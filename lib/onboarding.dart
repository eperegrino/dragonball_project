import 'package:dragonball_project/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  String onboardingImage;
  bool isVisible;
  String onboardingText;
}

class OnboardingViewModel {
  OnboardingModel onboardingModel;

  OnboardingViewModel() {
    onboardingModel = OnboardingModel();
  }

  void setImage(String image) {
    onboardingModel.onboardingImage = image;
  }

  String getImage() {
    return onboardingModel.onboardingImage;
  }

  void setVisible(bool visible) {
    onboardingModel.isVisible = visible;
  }

  bool isVisible() {
    return onboardingModel.isVisible;
  }

  void setText(String text) {
    onboardingModel.onboardingText = text;
  }

  String getText() {
    return onboardingModel.onboardingText;
  }
}

class OnboardingPagination extends StatelessWidget {
  OnboardingViewModel onboardingViewModel1;
  OnboardingViewModel onboardingViewModel2;

  OnboardingPagination() {
    onboardingViewModel1 = OnboardingViewModel();
    onboardingViewModel1.setImage("images/dbz1.png");
    onboardingViewModel1.setVisible(false);
    onboardingViewModel1.setText("");
    onboardingViewModel2 = OnboardingViewModel();
    onboardingViewModel2.setImage("images/dbz.png");
    onboardingViewModel2.setVisible(true);
    onboardingViewModel2.setText("Oi, eu sou o Goku!");
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
                        child: Text("Vamos começar!"),
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