import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/ListCategory.dart';
import 'FilterProductsPage.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/OfferSlider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchTextFormField.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              children: [
                SearchTextFormField(),
                SizedBox(
                  width: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    FilterProducts(context);
                  },
                  child: CircularAppcontainer(
                    Icon(
                      Icons.filter_list,
                      color: MainColor,
                      size: 25,
                    ),
                    ContainerColor: Colors.blue,
                  ),
                )
              ],
            ),

            SizedBox(height: 22),
            AppText("Select Category", 'H2'),
            SizedBox(height: 10),
            ListCategory(false),

            SizedBox(height: 24),
            ProductViewContainer(),
            SizedBox(
              height: 20,
            ),
            AppText("New Offers", 'H2'),
            SizedBox(
              height: 6,
            ),
            OfferSlider(),
            SizedBox(
              height: 13,
            ),

            // Wrapping ProductViewContainer in Expanded to allow it to fill space
          ],
        ),
      ),
    );
  }
}
