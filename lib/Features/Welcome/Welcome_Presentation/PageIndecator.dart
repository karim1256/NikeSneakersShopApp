import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';

class PageIndecator extends StatelessWidget {
  bool? firstContainer;
  bool? secondContainer;
  bool? thirdContainer;

  PageIndecator(
      {this.firstContainer,
      this.secondContainer,
      this.thirdContainer,
      super.key});

  Widget Containers(bool selectedPage) {
    return Container(
      width: selectedPage ? 25 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectedPage ? Colors.amber[600] : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Containers(firstContainer == null ? false : true),
        SizedBox(
          width: 3,
        ),
        Containers(secondContainer == null ? false : true),
        SizedBox(
          width: 3,
        ),
        Containers(thirdContainer == null ? false : true)
      ],
    );
  }
}
//OnboardOnePic.png
