import 'dart:ui';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/ProductsView.dart';

import 'package:nikesneakersshopapp/data.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';

class ProductViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch filtered categories once and store them in a variable
    final p = Provider.of<FeatureProvider>(context);

    return p.FilterCategories().isEmpty
        ? NoProductsFound()
        : ProductsView(p.FilterCategories());
  }
}
