import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'OnboardThree.dart';
import 'PageIndecator.dart';
import 'WelcomeNavigateButton.dart';

class OnboardPageTwo extends StatelessWidget {
  const OnboardPageTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Bluetheme,
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
                top: 30,
                child: Image.asset("lib/Core/Assets/OnboardTwoPic.png",
                    width: 300)),
            Positioned(
                left: 40,
                top: 240,
                child: Image.asset("lib/Core/Assets/Shadow.png")),
            Positioned(
                bottom: 280,
                right: 73,
                child: Image.asset(
                  "lib/Core/Assets/OnboardTwoTxt.png",
                  width: 220,
                )),
            Positioned(
                bottom: 200,
                child: Image.asset("lib/Core/Assets/ShadowNike.png")),
            Positioned(
                top: 390,
                right: 55,
                child: Image.asset("lib/Core/Assets/OnboardTwoTxt2.png")),
            Positioned(
                bottom: 65,
                left: 265,
                child: Image.asset("lib/Core/Assets/OnboardDrawTwo.png")),
            Positioned(
                top: 75,
                left: 265,
                child: Image.asset("lib/Core/Assets/OnboardDrawTwo.png")),
            Positioned(
                top: 75,
                right: 250,
                child: Image.asset(
                  "lib/Core/Assets/OnboardDrawOne.png",
                  width: 150,
                )),
            Positioned(
                bottom: 40,
                left: 50,
                child: WelcomeNaviagateButton(OnboardPageThree())),
            Positioned(
                bottom: 170,
                left: 150,
                child: PageIndecator(
                  secondContainer: true,
                ))
          ],
        ));
  }
}
//OnboardOnePic.png
