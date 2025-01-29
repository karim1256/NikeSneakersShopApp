import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'DiscardChange.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'Profile_Body.dart';

PreferredSizeWidget ProfileAppBar(BuildContext c, {bool? back = false}) {
  var p = Provider.of<AccountServiceProvider>(c, listen: false);

  return ApplicationAppBar(
      leadingAppBar: MaterialButton(
        onPressed: () {
          if (p.GetCheckChange) {
            DiscardChange(c);
          } else {
            Navigator.pop(c);
          }
        },
        child: CircularAppcontainer(
          Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      title: "Profile");
}
