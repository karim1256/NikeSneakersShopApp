import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/HomePageAppBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/home_Page_Body.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_Body.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_AppBar.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchBody.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  List<dynamic> appBarList = [HomePageAppBar(), FavoriteProductsAppBar(null)];
  List<dynamic> bodyList = [
    HomePageBody(),
    FavouriteProductsBody(),
    SearchBody()
  ];

  Widget build(BuildContext context) {
    final featureProvider = Provider.of<FeatureProvider>(context);

    return Scaffold(
      bottomNavigationBar: AppNavigationBar(),
      appBar: featureProvider.SelectedPage == 2
          ? null
          : appBarList[featureProvider.SelectedPage],
      body: bodyList[featureProvider.SelectedPage],
    );
  }
}
