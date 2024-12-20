import 'package:flutter/services.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'FilterizeTextFormField.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:flutter/material.dart';
import 'ListCategory.dart';

Widget FilterizePrice(String PriceType, GlobalKey<FormState> Key,
    TextEditingController Controller) {
  return Column(
    children: <Widget>[
      Text(PriceType,
          style: TextStyle(
              color: Bluetheme, fontSize: 15, fontWeight: FontWeight.bold)),
      PriceRangeFormField(PriceType, Key, Controller)
    ],
  );
}

Text PageText(String text, {double? s}) {
  return Text(" $text",
      style: TextStyle(
          color: Colors.black,
          fontSize: s == null ? 23 : s,
          fontWeight: FontWeight.bold));
}

Widget ActionButton(String t, void fun()) {
  return TextButton(
      onPressed: fun,
      child: Text(
        t,
        style: TextStyle(fontSize: 19, color: Bluetheme),
      ));
}

Future<dynamic> FilterProducts(BuildContext c) {
  final provider = Provider.of<FeatureProvider>(c, listen: false);

  return showDialog(
      context: c!,
      builder: (context) => AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Bluetheme,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: 300,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText("---Filter---", 'H1'),
                      SizedBox(
                        height: 15,
                      ),
                      PageText("-Price-"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FilterizePrice(
                              'From', priceFromKey, priceFromController),
                          SizedBox(
                            width: 20,
                          ),
                          FilterizePrice('To', priceToKey, priceToController),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      PageText("-Category-", s: 20),
                      SizedBox(
                        height: 10,
                      ),
                      ListCategory(true)
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Center(
                child: Column(
                  children: [
                    Divider(
                      color: Bluetheme,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ActionButton(
                      "Filter",
                      () {
                        if (priceFromKey.currentState!.validate() &&
                            priceToKey.currentState!.validate()) {
                          priceFromKey.currentState!.save();
                          priceToKey.currentState!.save();
                          print(FromOnsave);
                          print(ToOnsave);
                          Filter = true;
                          print(Filter);
                          Navigator.pop(c);
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ));
}
