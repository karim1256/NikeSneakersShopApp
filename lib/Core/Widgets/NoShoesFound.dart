import 'package:flutter/material.dart';

Widget NoProductsFound() {
  return Center(
      child: Container(
    height: 160,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Text(
          "No Shoes Found",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Image.asset(
          'lib/Core/Assets/NikeBlackLogo.png',
          width: 80,
          height: 50,
        ),
      ],
    ),
  ));
}
