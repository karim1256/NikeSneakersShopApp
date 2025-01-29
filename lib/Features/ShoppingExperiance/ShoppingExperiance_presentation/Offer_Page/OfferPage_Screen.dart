import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'OfferPage_AppBar.dart';
import 'OfferPage_Body.dart';

class OfferPageScreen extends StatelessWidget {
  const OfferPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor,
      appBar: OfferPageAppBar(context),
      body: OfferPageBody(),
    );
  }
}
