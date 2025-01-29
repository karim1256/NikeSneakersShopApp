import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'Payment_Option_AppBar.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'Payment_Option_Body.dart';

class PaymentOptionsScreen extends StatelessWidget {
  PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor,
      appBar: PaymentOptionsAppBar(context),
      body: PaymentOptionsBody(),
    );
  }
}
