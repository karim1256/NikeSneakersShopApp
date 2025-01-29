import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'ListSize.dart';
import 'package:nikesneakersshopapp/Core/Widgets/ProductsView.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'dart:ui_web' as ui_web;
import 'pic.dart';

class SingleProductViewBody extends StatelessWidget {
  Map SingleProduct;
  SingleProductViewBody(this.SingleProduct, {super.key});
  @override
  String GlassImage = '';
  String ColorImage = '';
  String currency = ' EGP';

  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);
    String MainImage = SingleProduct['mainimage'];
    String currentColorImage = SingleProduct['colorimage'];
    bool CartCheck(int id, int size) {
      if (p.Cart.isEmpty) {
        return false;
      } else {
        for (var item in p.Cart) {
          if (item['id'] == id && item['size'] == size) {
            // Simplify condition
            return true;
          }
        }
        return false;
      }
    }

    bool ChechFavouriteProducts(int l) {
      return p.favouriteProductId.contains(l);
    }

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: 300,
                child: Text(
                  SingleProduct['name'],
                  style: TextStyle(
                      color: Bluetheme,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                )),
            Text(
              SingleProduct['Category'] + " Shoes",
              style: TextStyle(color: GreyText, fontSize: 22),
            ),
            AppText(SingleProduct['price'].toString() + currency, "H2"),
            ProductDetailAnimation(SingleProduct['mainimage']),
            //SizedBox(height: 20),
            // Container(
            //   height: 70,
            //   width: 400,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount:
            //         4, // Make sure you have at least 4 images or adjust this number
            //     separatorBuilder: (BuildContext context, int index) =>
            //         SizedBox(width: 10),
            //     itemBuilder: (BuildContext context, int i) {
            //       return MaterialButton(
            //         onPressed: () {},
            //         child: Container(
            //           width: 70,
            //           height: 70,
            //           decoration: BoxDecoration(
            //             color: ContainersColor,
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Image.asset(
            //             'lib/Core/Assets/SmallImage$i.png', // Ensure these images exist
            //             width: 50,
            //             fit: BoxFit.contain,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(height: 10),
            ListSize(SingleProduct['size']),
            SizedBox(height: 15),
            Text(
              SingleProduct['description'],
              maxLines: p.GetSingleProductReadMore ? 7 : 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: GreyText),
            ),
            TextButton(
              onPressed: () {
                p.SetSingleProductReadMore = !p.GetSingleProductReadMore;
              },
              child: Text(
                p.GetSingleProductReadMore ? "read less" : "read more",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            SizedBox(height: p.GetSingleProductReadMore ? 0 : 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    if (p.favouriteProductId.contains(SingleProduct["id"])) {
                      p.FavouriteProductDelete(SingleProduct["id"]);
                    } else {
                      p.AddFavouriteProduct(SingleProduct["id"]);
                    }
                    print(p.favouriteProductId);
                  },
                  child: CircularAppcontainer(
                    Icon(
                      Icons.favorite,
                      color: p.favouriteProductId.contains(SingleProduct["id"])
                          ? Colors.red
                          : MainColor,
                    ),
                    size: 51,
                    ContainerColor: Color(0xffb9b8b8),
                  ),
                ),
                SizedBox(width: 12),
                MaterialButton(
                  onPressed: p.productSize != 0
                      ? () {
                          if (CartCheck(SingleProduct["id"], p.productSize!)!) {
                            p.CartProductDelete(
                                SingleProduct["id"], p.productSize!);
                          } else {
                            p.CartProductADD(SingleProduct["id"],
                                p.productSize!, SingleProduct["price"]);
                          }

                          CartCheck(SingleProduct["id"], p.productSize!)!
                              ? p.SubTotal.add(0)
                              : null;
                          print(p.Cart);
                          print(
                              CartCheck(SingleProduct["id"], p.productSize!)!);
                        }
                      : null,
                  child: Container(
                    width: 190,
                    height: 50,
                    decoration: BoxDecoration(
                      color: CartCheck(SingleProduct["id"], p.productSize!)!
                          ? ContainersColor
                          : Bluetheme,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          CartCheck(SingleProduct["id"], p.productSize!)
                              ? Icons.remove_circle_outline_outlined
                              : Icons.shopping_bag_outlined,
                          color: CartCheck(SingleProduct["id"], p.productSize!)
                              ? Bluetheme
                              : MainColor,
                          size: 23,
                        ),
                        SizedBox(width: 5),
                        Text(
                          CartCheck(SingleProduct["id"], p.productSize!)
                              ? "Remove"
                              : "Add to Cart",
                          style: TextStyle(
                              color:
                                  CartCheck(SingleProduct["id"], p.productSize!)
                                      ? Bluetheme
                                      : ContainersColor,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
