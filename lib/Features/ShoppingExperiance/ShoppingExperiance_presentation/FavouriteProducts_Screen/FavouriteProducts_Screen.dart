import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'FavouriteProducts_AppBar.dart';
import 'FavouriteProducts_Body.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';

class FavouriteProductsScreen extends StatelessWidget {
  FavouriteProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor,
        appBar: FavoriteProductsAppBar(context),
        body: FavouriteProductsBody(),
        bottomNavigationBar: AppNavigationBar());
  }
}
