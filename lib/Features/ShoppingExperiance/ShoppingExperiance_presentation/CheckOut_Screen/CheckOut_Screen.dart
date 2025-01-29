import 'package:flutter/material.dart';
import 'CheckOut_AppBar.dart';
import 'CheckOut_Body.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_PaymentSummary.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor,
        appBar: CheckOutAppBar(context),
        body: CheckOutBody());
  }
}
