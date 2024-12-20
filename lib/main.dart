import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/CheckOut_Screen/CheckOut_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppScreen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchBody.dart';

import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_Screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeatureProvider(),
      child: MaterialApp(
        home:
            //CartScreen(),
            //  SingleProductView(),
            AppScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
