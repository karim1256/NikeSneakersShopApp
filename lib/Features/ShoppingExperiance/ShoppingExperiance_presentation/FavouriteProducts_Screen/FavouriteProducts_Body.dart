import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/NoShoesFound.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

List filterFavouritProducts() {
  List FavouriteProducts = [];
  for (int i = 0; i <= FavouriteProductId.length - 1; i++) {
    for (int j = 0; j <= Products.length - 1; j++) {
      if (Products[j]['id'] == FavouriteProductId[i]) {
        FavouriteProducts.add(Products[j]);
      }
    }
  }
  print(FavouriteProducts);
  return FavouriteProducts;
}

int RemoverFavouritProducts(int k) {
  int? del;
  for (int i = 0; i <= FavouriteProductId.length - 1; i++) {
    if (filterFavouritProducts()[k]['id'] == FavouriteProductId[i]) {
      del = i;
    }
  }

  return del!;
}

class FavouriteProductsBody extends StatefulWidget {
  FavouriteProductsBody({super.key});

  @override
  State<FavouriteProductsBody> createState() => _FavouriteProductsBodyState();
}

class _FavouriteProductsBodyState extends State<FavouriteProductsBody> {
  @override
  Widget build(BuildContext context) {
    return filterFavouritProducts().isEmpty
        ? NoProductsFound()
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: filterFavouritProducts().length,
                  itemBuilder: (context, i) {
                    return Stack(
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
                          left: 10,
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
                                  filterFavouritProducts()[i]["name"],
                                  style: TextStyle(
                                      color: GreyText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  filterFavouritProducts()[i]["price"]
                                      .toString(),
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
                          right: 21,
                          bottom: 0,
                          child: Container(
                            height: 35,
                            width: 32,
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
                                  FavouriteProductId[
                                      RemoverFavouritProducts(i)] = 0;
                                });
                                print(FavouriteProductId);
                              },
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: FavouriteProductId[
                                            RemoverFavouritProducts(i)] !=
                                        0
                                    ? Colors.red
                                    : null,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
  }
}
