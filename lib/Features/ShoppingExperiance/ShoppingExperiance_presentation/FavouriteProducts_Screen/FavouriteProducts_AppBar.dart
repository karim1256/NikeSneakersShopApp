import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

PreferredSizeWidget FavoriteProductsAppBar(BuildContext? c) {
  return ApplicationAppBar(
      // leadingAppBar: MaterialButton(
      //   onPressed: () {
      //     Navigator.pop(c!);
      //   },
      //   child: CircularAppcontainer(
      //     Center(
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //       ),
      //     ),
      //   ),
      // ),
      title: "Favourite",
      actionAppBar: null

      /* [
      CircularAppcontainer(
        Icon(
          Icons.favorite_border,
          color: Colors.black,
        ),
      ),
    ],
    */
      );
}
