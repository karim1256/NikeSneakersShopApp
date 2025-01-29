import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';
import 'package:nikesneakersshopapp/Core/Widgets/ProductsView.dart';

class PaymentOptionsBody extends StatelessWidget {
  PaymentOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context, listen: false);

    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(onPressed: () {}, child: Text('online payment')));
  }
}
