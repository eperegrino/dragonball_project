import 'package:dragonball_project/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(children: <Widget>[
        Onboarding("images/dbz1.png", false, ""),
        Onboarding("images/dbz.png", true, "Oi, eu sou o Goku!"),
      ],
    );
  }
}

class Onboarding extends StatelessWidget {
  final String onboardingImage;
  final bool isVisible;
  final String onboardingText;

  Onboarding(this.onboardingImage, this.isVisible, this.onboardingText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          OnboardingBackground(onboardingImage),
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
                      child: Text(onboardingText, style: TextStyle(color: Colors.white, fontSize: 30),),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 70),
                    //   child: Text("Descubra informações dos personagens do mundo de Dragon Ball", style: TextStyle(color: Colors.white, fontSize: 15),),
                    // ),
                    Visibility(
                      visible: isVisible,
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