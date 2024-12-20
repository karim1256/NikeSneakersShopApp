import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class ListCategory extends StatefulWidget {
  final bool? Filter; // Changed to final for better practice
  ListCategory(
    this.Filter, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  List<String> category = ['All Shoes', 'Outdoor', 'Tennis', 'Basketball'];

  Widget categoryAppContainer(
      String title, Color textColor, Color containerColor, bool? filter) {
    return Container(
      padding: EdgeInsets.all(6),
      width: filter! ? 80 : 100,
      height: widget.Filter! ? 35 : 45,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final featureProvider = Provider.of<FeatureProvider>(context);

    return Container(
      width: widget.Filter! ? 450 : 400, // Accessing Filter via widget
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            onPressed: () {
              setState(() {
                featureProvider.SelactedCategory = category[index];
              });
              print(featureProvider.SelactedCategory);
            },
            child: categoryAppContainer(
              category[index],
              category[index] == featureProvider.SelactedCategory
                  ? MainColor
                  : Colors.black,
              category[index] == featureProvider.SelactedCategory
                  ? Bluetheme
                  : ContainersColor,
              widget.Filter, // Pass the Filter value correctly
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: widget.Filter! ? 7 : 10),
      ),
    );
  }
}
