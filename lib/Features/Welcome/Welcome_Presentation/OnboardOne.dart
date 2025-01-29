import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'WelcomeNavigateButton.dart';
import 'OnboardTwo.dart';
import 'PageIndecator.dart';

class OnboardPageOne extends StatelessWidget {
  const OnboardPageOne({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bluetheme,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
          ),
          Positioned(
              top: 30,
              left: 33,
              child: Image.asset("lib/Core/Assets/ImageTag.png")),
          Positioned(
              top: 50,
              right: 90,
              child: Image.asset("lib/Core/Assets/OnboardOneTxt.png")),
          Positioned(
              top: 130,
              right: 130,
              child: Image.asset("lib/Core/Assets/OnboardOneLine.png")),
          Positioned(child: Image.asset("lib/Core/Assets/OnboardOnePic.png")),
          Positioned(
              bottom: 170,
              child: Image.asset("lib/Core/Assets/ShadowNike.png")),
          Positioned(
              top: 195,
              right: 265,
              child: Image.asset("lib/Core/Assets/OnboardDrawOne.png")),
          Positioned(
              bottom: 50,
              left: 265,
              child: Image.asset("lib/Core/Assets/OnboardDrawTwo.png")),
          Positioned(
              bottom: 170,
              child: Image.asset("lib/Core/Assets/ShadowNike.png")),
          Positioned(
              bottom: 40,
              left: 50,
              child: WelcomeNaviagateButton(OnboardPageTwo())),
          Positioned(
              bottom: 170,
              left: 150,
              child: PageIndecator(
                firstContainer: true,
              ))
        ],
      ),
    );
  }
}
//OnboardOnePic.png
