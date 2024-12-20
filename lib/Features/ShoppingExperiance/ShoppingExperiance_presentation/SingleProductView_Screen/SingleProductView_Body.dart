import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'ListSize.dart';

class SingleProductViewBody extends StatefulWidget {
  const SingleProductViewBody({super.key});
  _SingleProductViewBodyState createState() => _SingleProductViewBodyState();
}

class _SingleProductViewBodyState extends State<SingleProductViewBody> {
  @override
  String GlassImage = '';

  String ColorImage = '';
  String currency = ' EGP';

  bool readmore = false;

  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context, listen: false);
    String MainImage = p.SingleProduct()['mainimage'];
    String currentColorImage = p.SingleProduct()['colorimage'];

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 0,
              ),
              SizedBox(
                  width: 300,
                  child: Text(
                    p.SingleProduct()['name'],
                    style: TextStyle(
                        color: Bluetheme,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  )),
              /* AppText('Nike Air Max 270 ', "H1"),
            AppText('Essential', "H1"),*/
              Text(p.SingleProduct()['Category'] + " Shoes",
                  style: TextStyle(color: GreyText, fontSize: 22)),
              AppText(p.SingleProduct()['price'].toString() + currency, "H2"),
              Center(
                  child: Image.asset(
                MainImage,
                width: 190,
              )),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 70,
                width: 400,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      4, // Change this if you have a dynamic list of images
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    return MaterialButton(
                      onPressed: () {
                        setState(() {
                          // Flip the images
                          String temp = MainImage;
                          MainImage = currentColorImage;
                          ColorImage = temp;
                        });
                      },
                      child: MaterialButton(
                        onPressed: () {},
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: ContainersColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'lib/Core/Assets/SmallImage$i.png',
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              ListSize(),
              SizedBox(height: 15),
              Text(p.SingleProduct()['description'],
                  maxLines: readmore ? 7 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: GreyText)),
              TextButton(
                onPressed: () {
                  setState(() {
                    readmore = !readmore;
                  });
                },
                child: Text(
                  readmore ? "read less" : "read more",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          int k = p.SingleProduct()["id"];
                          FavouriteProductId[k - 1] == p.SingleProduct()["id"]
                              ? FavouriteProductId[k - 1] = 0
                              : FavouriteProductId[k - 1] =
                                  p.SingleProduct()["id"];
                        });
                        print(FavouriteProductId);
                      },
                      child: CircularAppcontainer(
                          Icon(
                            Icons.favorite,
                            color: FavouriteProductId[
                                        p.SingleProduct()['id'] - 1] ==
                                    0
                                ? MainColor
                                : Colors.red,
                          ),
                          size: 51,
                          ContainerColor: Color(0xffb9b8b8))),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        p.CartCheck(p.SingleProduct()["id"])!
                            ? p.CartProductDelete(p.SingleProduct()["id"])
                            : p.CartProductADD(p.SingleProduct()["id"],
                                p.productSize!, p.SingleProduct()["price"]);
                        p.CartCheck(p.SingleProduct()["id"])!
                            ? p.SubTotal.add(0)
                            : null;
                      });
                      print(p.Cart);
                      print(p.SubTotal);
                    },
                    child: Container(
                      width: 190,
                      height: 50,
                      decoration: BoxDecoration(
                        color: p.CartCheck(p.SingleProduct()["id"])!
                            ? ContainersColor
                            : Bluetheme,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            p.CartCheck(p.SingleProduct()["id"])!
                                ? Icons.remove_circle_outline_outlined
                                : Icons.shopping_bag_outlined,
                            color: p.CartCheck(p.SingleProduct()["id"])!
                                ? Bluetheme
                                : MainColor,
                            size: 23,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            p.CartCheck(p.SingleProduct()["id"])!
                                ? "Remove"
                                : "Add to Cart",
                            style: TextStyle(
                                color: p.CartCheck(p.SingleProduct()["id"])!
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
          ),
        ));
  }
}
