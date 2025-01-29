import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_Body.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchBody.dart';

class ProductsView extends StatelessWidget {
  final List WhichPage;

  const ProductsView(this.WhichPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<FeatureProvider>(context);
    var p2 = Provider.of<FeatureProvider>(context);

    // List WhichPage() {
    //   if (widget.FavoriteProduvtsPage == 'FavouritePage') {
    //     return p.filterFavouritProducts();
    //   } else if (widget.FavoriteProduvtsPage == 'HomePage') {
    //     return p.FilterCategories();
    //   } else {
    //     return p.foundShoes;
    //   }
    // }

    return WhichPage.isEmpty
        ? NoProductsFound()
        : Container(
            height: WhichPage.length <= 2 ? 180 : 365,
            width: 400,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 0,
              ),
              itemCount: WhichPage.length,
              itemBuilder: (context, i) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SingleProductView(WhichPage[i])));
                    print(WhichPage[i]);
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
                                WhichPage[i]["feature"],
                                style: TextStyle(
                                    color: Bluetheme,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 3),
                              Text(
                                WhichPage[i]["name"],
                                style: TextStyle(
                                    color: GreyText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                WhichPage[i]["price"].toString(),
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
                              if (p.favouriteProductId
                                  .contains(WhichPage[i]["id"])) {
                                p.FavouriteProductDelete(WhichPage[i]["id"]);
                              } else {
                                p.AddFavouriteProduct(WhichPage[i]["id"]);
                              }
                            },
                            icon: Icon(
                              Icons.favorite_rounded,
                              color: p.favouriteProductId
                                      .contains(WhichPage[i]['id'])
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
}
