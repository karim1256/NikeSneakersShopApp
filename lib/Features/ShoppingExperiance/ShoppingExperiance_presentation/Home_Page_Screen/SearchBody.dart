import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/ListCategory.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/home_Page_Body.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';

import 'package:nikesneakersshopapp/data.dart';
import 'FilterProductsPage.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/OfferSlider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchTextFormField.dart';
import 'Home_Page_screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';
import 'package:nikesneakersshopapp/Core/Widgets/ProductsView.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    void _runFilter(String enteredKeyword) {
      List<dynamic> results = [];
      if (enteredKeyword.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        results = Products;
      } else {
        results = Products.where((product) => product["name"]
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase())).toList();
        // we use the toLowerCase() method to make it case-insensitive
      }
      p.SearchSet = results;
    }

    return Scaffold(
      backgroundColor: MainColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            Center(
              // Center the entire Row
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center children of Row
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: CircularAppcontainer(
                        Icon(
                          Icons.arrow_back_ios_sharp,
                          color: MainColor,
                        ),
                        ContainerColor: Colors.blue,
                        size: 52),
                  ),
                  // Add some spacing between the button and the text field
                  Form(
                    child: Container(
                      width: 255,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 2, // Spread the shadow
                            blurRadius: 10, // Blur effect
                            offset: Offset(0, 5), // Vertical shadow position
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          _runFilter(value);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide.none,
                          ),
                          label: Row(
                            children: <Widget>[
                              Icon(Icons.search_outlined),
                              SizedBox(width: 5),
                              Text("Looking for shoes"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ProductsView(p.SearchGET))

            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: GridView.builder(
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 15,
            //         crossAxisSpacing: 20,
            //       ),
            //       itemCount: p.SearchGET.length,
            //       itemBuilder: (context, i) {
            //         return MaterialButton(
            //           onPressed: () {
            //             Navigator.of(context).push(MaterialPageRoute(
            //                 builder: (context) =>
            //                     SingleProductView(p.SearchGET[i])));
            //             print(p.SingleProduct());
            //           },
            //           child: Stack(
            //             children: [
            //               Container(
            //                 height: 240,
            //                 width: 150,
            //                 decoration: BoxDecoration(
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: Colors.black.withOpacity(0.1),
            //                       spreadRadius: 2,
            //                       blurRadius: 10,
            //                       offset: Offset(0, 5),
            //                     ),
            //                   ],
            //                   color: ContainersColor,
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //               Positioned(
            //                 bottom: 15,
            //                 left: 10,
            //                 child: SizedBox(
            //                   width: 140,
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         "BEST SELLER",
            //                         style: TextStyle(
            //                             color: Bluetheme,
            //                             fontWeight: FontWeight.w500),
            //                       ),
            //                       Text(
            //                         p.SearchGET[i]["name"],
            //                         style: TextStyle(
            //                             color: GreyText,
            //                             fontWeight: FontWeight.w500,
            //                             fontSize: 15),
            //                         overflow: TextOverflow.ellipsis,
            //                         maxLines: 1,
            //                       ),
            //                       Text(
            //                         p.SearchGET[i]["price"].toString(),
            //                         style: TextStyle(
            //                             color: GreyText,
            //                             fontWeight: FontWeight.w500,
            //                             fontSize: 15),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Positioned(
            //                 bottom: 52,
            //                 left: 20,
            //                 child: Container(
            //                     width: 150,
            //                     height: 120,
            //                     child: Image.asset(
            //                         'lib/Core/Assets/nike${k[i]}.png')),
            //               ),
            //               Positioned(
            //                 right: 0,
            //                 bottom: 0,
            //                 child: Container(
            //                   height: 36,
            //                   width: 32,
            //                   decoration: BoxDecoration(
            //                     color: Bluetheme,
            //                     borderRadius: BorderRadius.only(
            //                         topLeft: Radius.circular(12.0),
            //                         bottomRight: Radius.circular(12.0)),
            //                   ),
            //                   alignment: Alignment.center,
            //                   child: IconButton(
            //                     onPressed: () {
            //                       // setState(() {
            //                       if (p.favouriteProductId
            //                           .contains(p.SearchGET[i]["id"])) {
            //                         p.FavouriteProductDelete(
            //                             p.SearchGET[i]["id"]);
            //                       } else {
            //                         p.AddFavouriteProduct(p.SearchGET[i]["id"]);
            //                       }
            //                       // });
            //                     },
            //                     icon: Icon(
            //                       Icons.favorite_rounded,
            //                       color: p.favouriteProductId
            //                               .contains(p.SearchGET[i]['id'])
            //                           ? Colors.red
            //                           : ContainersColor,
            //                       size: 20,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),

            ,
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
