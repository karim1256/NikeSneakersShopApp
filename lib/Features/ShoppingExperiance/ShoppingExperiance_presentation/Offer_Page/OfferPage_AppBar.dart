import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';

PreferredSizeWidget OfferPageAppBar(BuildContext c) {
  return ApplicationAppBar(
    leadingAppBar: MaterialButton(
      onPressed: () {
        Navigator.pop(c);
      },
      child: CircularAppcontainer(
        Center(
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
    ),
    title: "Offer",
    titleSize: 26,
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
