import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

PreferredSizeWidget CheckOutAppBar(BuildContext c) {
  return ApplicationAppBar(
    leadingAppBar: MaterialButton(
      onPressed: () {
        Navigator.pop(c);
      },
      child: CircularAppcontainer(
        Icon(
          Icons.arrow_back_ios,
        ),
      ),
    ),
    title: "CheckOut",
  );
}
