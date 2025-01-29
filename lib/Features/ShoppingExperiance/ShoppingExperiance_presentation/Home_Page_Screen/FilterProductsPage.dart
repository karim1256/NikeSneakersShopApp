import 'package:flutter/services.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:flutter/material.dart';
import 'ListCategory.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    final List<String> filterOptions = [
      "Price",
      "Newest",
      "Best Seller",
      "Offer"
    ];
    return PopupMenuButton<String>(
      onSelected: (String value) {
        p.GETFilterValue == value
            ? p.SETfilterValue = ""
            : p.SETfilterValue = value;
        print(p.GETFilterValue);
      },
      itemBuilder: (BuildContext context) {
        return filterOptions.map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(value,
                style: value == p.GETFilterValue
                    ? TextStyle(color: Bluetheme)
                    : null),
          );
        }).toList();
      },
      child: CircularAppcontainer(
        Icon(
          Icons.filter_list,
          color: MainColor,
          size: 25,
        ),
        ContainerColor: Colors.blue,
      ),
    );
  }
}
