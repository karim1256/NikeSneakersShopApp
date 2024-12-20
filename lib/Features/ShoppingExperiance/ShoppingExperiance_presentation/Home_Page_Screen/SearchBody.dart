import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/ListCategory.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/home_Page_Body.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'FilterProductsPage.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/OfferSlider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchTextFormField.dart';
import 'Home_Page_screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class SearchBody extends StatefulWidget {
  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  List<dynamic> _foundShoes = [];
  initState() {
    _foundShoes = Products;
    super.initState();
  }

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
    setState(() {
      _foundShoes = results;
    });
  }

  Widget build(BuildContext context) {
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
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            // Use Expanded to take available space
                            child: TextField(
                              onChanged: (value) => _runFilter(value),
                              cursorColor: Bluetheme,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusColor: Bluetheme,
                                hoverColor: Colors.grey,
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                labelText:
                                    "Looking for shoes", // Changed to labelText for better alignment
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: _foundShoes.length,
                  itemBuilder: (context, i) {
                    return Stack(
                      children: [
                        Container(
                          height: 240,
                          width: 150,
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
                          bottom: 15,
                          left: 10,
                          child: SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BEST SELLER",
                                  style: TextStyle(
                                      color: Bluetheme,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  _foundShoes[i]["name"],
                                  style: TextStyle(
                                      color: GreyText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  _foundShoes[i]["price"].toString(),
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
                          bottom: 52,
                          left: 20,
                          child: Container(
                              width: 150,
                              height: 120,
                              child: Image.asset(
                                  'lib/Core/Assets/nike${k[i]}.png')),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 36,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Bluetheme,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0)),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
