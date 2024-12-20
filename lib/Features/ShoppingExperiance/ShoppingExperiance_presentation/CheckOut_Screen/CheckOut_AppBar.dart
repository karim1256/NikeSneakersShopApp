import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

PreferredSizeWidget CheckOutAppBar() {
  return ApplicationAppBar(
    leadingAppBar: CircularAppcontainer(
      Icon(
        Icons.arrow_back,
      ),
    ),
    title: "CheckOut",
  );
}
