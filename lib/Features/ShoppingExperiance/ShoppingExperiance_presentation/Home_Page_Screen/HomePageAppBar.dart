import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';
import 'Drawer.dart';

PreferredSizeWidget HomePageAppBar(BuildContext c) {
  return ApplicationAppBar(
    leadingAppBar: Container(
      height: 30, // Updated size
      width: 30, // Updated size
      child: Builder(
        builder: (c) => MaterialButton(
          onPressed: () {
            Scaffold.of(c).openDrawer();
            // Navigator.push(
            //     c,
            //     MaterialPageRoute<bool>(
            //         builder: (BuildContext context) => HomeDrawer()));
          },
          child: Image.asset(
            "lib/Core/Assets/HomePageLeadingAppBarIcon.png",
            width: 60, height: 60,
            fit: BoxFit.contain, // Adjust to contain the image properly
          ),
        ),
      ),
    ),
    title: "Explore",
    actionAppBar: [
      MaterialButton(
        onPressed: () {
          Navigator.push(
            c,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CartScreen(),
            ),
          );
        },
        child: CircularAppcontainer(
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}
