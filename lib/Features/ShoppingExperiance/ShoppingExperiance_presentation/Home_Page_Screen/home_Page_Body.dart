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

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 5),
            Row(
              children: [
                SearchTextFormField(),
                const SizedBox(width: 5),
                Filter()
              ],
            ),
            const SizedBox(height: 14),
            AppText("Select Category", 'H2'),
            const SizedBox(height: 10),
            ListCategory(false),
            const SizedBox(height: 24),
            ProductViewContainer(),
            const SizedBox(height: 20),
            AppText("New Offers", 'H2'),
            const SizedBox(height: 6),
            OfferSlider(),
            const SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}
