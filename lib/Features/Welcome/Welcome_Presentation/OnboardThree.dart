import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'PageIndecator.dart';
import 'WelcomeNavigateButton.dart';
import 'OnboardOne.dart';
import 'package:nikesneakersshopapp/Features/SignUpSignIn/SignInPage.dart';

class OnboardPageThree extends StatelessWidget {
  const OnboardPageThree({super.key});
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
                bottom: 300,
                left: 20,
                child: Image.asset("lib/Core/Assets/OnboardThreePic.png",
                    width: 300)),
            Positioned(
                left: 60,
                top: 240,
                child: Image.asset("lib/Core/Assets/Shadow.png")),
            Positioned(
                bottom: 280,
                right: 78,
                child: Image.asset(
                  "lib/Core/Assets/OnboardThreeTxt.png",
                  width: 190,
                )),
            Positioned(
                bottom: 200,
                child: Image.asset("lib/Core/Assets/ShadowNike.png")),
            Positioned(
                top: 385,
                right: 27,
                child: Image.asset("lib/Core/Assets/OnboardThreeTxt2.png")),
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
                child: WelcomeNaviagateButton(SignInPage())),
            Positioned(
                bottom: 170,
                left: 150,
                child: PageIndecator(
                  thirdContainer: true,
                ))
          ],
        ));
  }
}
//OnboardOnePic.png
