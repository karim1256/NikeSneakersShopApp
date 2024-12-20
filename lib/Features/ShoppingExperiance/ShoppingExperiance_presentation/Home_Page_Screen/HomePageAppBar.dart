import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';

PreferredSizeWidget HomePageAppBar() {
  return ApplicationAppBar(
    leadingAppBar: Container(
      height: 20, // Updated size
      width: 20, // Updated size
      child: Image.asset(
        "lib/Core/Assets/HomePageLeadingAppBarIcon.png",
        fit: BoxFit.contain, // Adjust to contain the image properly
      ),
    ),
    title: "Explore",
    actionAppBar: [
      CircularAppcontainer(
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
        ),
      ),
    ],
  );
}
