import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'Cart_AppBar.dart';
import 'Cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor,
        appBar: CartAppBar(context),
        body: CartBody());
  }
}
