import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductView_AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductView_Body.dart';

class SingleProductView extends StatelessWidget {
  Map SinglePoduct;
  SingleProductView(this.SinglePoduct, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor,
        appBar: SingleProductVieweAppBar(context),
        body: SingleProductViewBody(SinglePoduct));
  }
}
