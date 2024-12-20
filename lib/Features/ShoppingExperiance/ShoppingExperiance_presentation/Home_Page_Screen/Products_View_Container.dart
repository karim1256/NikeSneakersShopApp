import 'dart:ui';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'FilterizeTextFormField.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';

List<int> FavouriteProductId = [0, 0, 0, 0, 0, 0, 0, 0, 0];

class ProductViewContainer extends StatefulWidget {
  @override
  State<ProductViewContainer> createState() => _ProductViewContainerState();
}

class _ProductViewContainerState extends State<ProductViewContainer> {
  List<Map> filteredProducts = [];
  @override
  Widget build(BuildContext context) {
    // Fetch filtered categories once and store them in a variable
    final p = Provider.of<FeatureProvider>(context, listen: false);
    filteredProducts = FilterCategories(context);

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

    return filteredProducts.isEmpty
        ? NoProductsFound()
        : Container(
            height: filteredProducts.length <= 2 ? 180 : 365,
            width: 400,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 0,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, i) {
                return MaterialButton(
                  onPressed: () {
                    p.SigleProductIdSet = filteredProducts[i]["id"];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SingleProductView()));
                    print(p.sigleProductId);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          color: ContainersColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 14,
                        child: SizedBox(
                          width: 138,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BEST SELLER",
                                style: TextStyle(
                                    color: Bluetheme,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 3),
                              Text(
                                filteredProducts[i]["name"],
                                style: TextStyle(
                                    color: GreyText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                filteredProducts[i]["price"].toString(),
                                style: TextStyle(
                                    color: GreyText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 65,
                        child: Container(
                            child: Image.asset(
                                'lib/Core/Assets/nike${k[i]}.png',
                                width: 140,
                                height: 120)),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 38,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Bluetheme,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                FavouriteProductId[i] ==
                                        filteredProducts[i]["id"]
                                    ? FavouriteProductId[i] = 0
                                    : FavouriteProductId[i] =
                                        filteredProducts[i]["id"];
                              });
                              print(FavouriteProductId);
                            },
                            icon: Icon(
                              Icons.favorite_rounded,
                              color: FavouriteProductId[i] ==
                                      filteredProducts[i]["id"]
                                  ? Colors.red
                                  : ContainersColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }

  List<Map> FilterCategories(BuildContext context) {
    List<Map> filteredCategories = [];
    // Assuming you have ToOnsave and FromOnsave variables available
    String ToOnsave = "310"; // Example values
    String FromOnsave = "300";
    bool Filter = true;

    for (Map product in Products) {
      if (Provider.of<FeatureProvider>(context, listen: true)
              .SelactedCategory ==
          'All Shoes') {
        filteredCategories.add(product);
      }
      if (product['Category'] ==
          Provider.of<FeatureProvider>(context, listen: true)
              .SelactedCategory) {
        filteredCategories.add(product);
      }
    }

    if (Filter) {
      filteredCategories.removeWhere((f) =>
          f["price"] > int.parse(ToOnsave) ||
          f["price"] < int.parse(FromOnsave));
    }

    return filteredCategories;
  }
}
