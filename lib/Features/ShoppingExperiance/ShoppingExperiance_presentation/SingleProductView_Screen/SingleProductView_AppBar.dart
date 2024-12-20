import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

PreferredSizeWidget SingleProductVieweAppBar(BuildContext c) {
  return ApplicationAppBar(
      leadingAppBar: MaterialButton(
        onPressed: () {
          Navigator.pop(c);
          Provider.of<FeatureProvider>(c, listen: false).SigleProductIdSet =
              null;
          print(Provider.of<FeatureProvider>(c, listen: false).sigleProductId);
        },
        child: CircularAppcontainer(
            Icon(
              Icons.arrow_back_ios,
            ),
            size: 70),
      ),
      title: "Sneaker Shop",
      actionAppBar: [
        MaterialButton(
          onPressed: () {
            Navigator.of(c)
                .push(MaterialPageRoute(builder: (c) => CartScreen()));
          },
          child: CircularAppcontainer(
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
        )
      ],
      titleSize: 20);
}
