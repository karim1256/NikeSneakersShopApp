import 'dart:js';

import 'package:flutter/material.dart';
import 'Theme.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/data.dart';

CircularAppcontainer(Widget AppBarIcon, {double? size, Color? ContainerColor}) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(15),
        width: size == null ? 50 : size,
        height: size == null ? 50 : size,
        decoration: BoxDecoration(
          color: ContainerColor == null ? Colors.white : ContainerColor,
          borderRadius: BorderRadius.circular(80),
        ),
        alignment: Alignment.center,
        child: AppBarIcon,
      ),
    ],
  );
}

Widget AppText(String title, TextType) {
  return Text(
    title,
    style: TextStyle(
        fontSize: TextType == 'H1' ? 27 : 20, fontWeight: FontWeight.bold),
  );
}

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

/*


 if (FeatureProvider().FilterGET &&
        product['price'] >= int.parse(FromOnsave) &&
        product['price'] <= int.parse(ToOnsave)) {
      filteredCategories.add(product);
    }
    ;
    */
/*
List FilterCategories() {
  List<dynamic> filterizedcategories = [];
  for (int i = 0; i < Products.length; i++) {
    if (Products[i]['Category'] == FeatureProvider().SelactedCategory) {
      filterizedcategories.add(Products[i]);
    } else if (FeatureProvider().SelactedCategory == 'All Shoes') {
      filterizedcategories.add(Products[i]);
    } else if (FeatureProvider().FilterGET == true) {
      if (filterizedcategories[i]["Price"] > int.parse(ToOnsave) &&
          filterizedcategories[i]["Price"] < int.parse(FromOnsave)) {
        filterizedcategories[i].clear();
      }
    }
  }
  return filterizedcategories;
}

List<dynamic>? FilterCategories() {
  List<dynamic> filteredCategories = [];

  for (var product in Products) {
    if (FeatureProvider().SelactedCategory == 'All Shoes') {
      filteredCategories.add(product);
    } else if (product['Category'] == FeatureProvider().SelactedCategory) {
      filteredCategories.add(product);
      if (!FeatureProvider().FilterGET ||
          (product['price'] >= int.parse(FromOnsave) &&
              product['price'] <= int.parse(ToOnsave))) {
        filteredCategories.add(product);
      }
    }
  }
  return filteredCategories;
}
*/
