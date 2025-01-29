import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class ListSize extends StatelessWidget {
  List<int> productSizeOptions;
  ListSize(this.productSizeOptions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    return Container(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: productSizeOptions.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 0),
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            onPressed: () {
              p.SETproductSize(
                  productSizeOptions[index]); // Update selected size
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: p.productSize == productSizeOptions[index]
                    ? Bluetheme
                    : ContainersColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                productSizeOptions[index].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: p.productSize == productSizeOptions[index]
                      ? MainColor
                      : Bluetheme,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
