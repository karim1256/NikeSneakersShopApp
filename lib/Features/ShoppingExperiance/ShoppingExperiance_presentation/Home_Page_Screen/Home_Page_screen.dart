import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'SearchTextFormField.dart';
import 'SearchBody.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/HomePageAppBar.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/home_Page_Body.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor,
        appBar: HomePageAppBar(),
        body: HomePageBody(),
        bottomNavigationBar: AppNavigationBar());
  }
}
