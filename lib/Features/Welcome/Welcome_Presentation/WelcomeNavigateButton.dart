import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';

class WelcomeNaviagateButton extends StatelessWidget {
  Widget NavigatePage;
  WelcomeNaviagateButton(this.NavigatePage, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NavigatePage));
        },
        child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MainColor,
            ),
            alignment: Alignment.center,
            child: Text(
              "Next",
              style: TextStyle(color: Bluetheme, fontSize: 20),
            )));
  }
}
//OnboardOnePic.png
