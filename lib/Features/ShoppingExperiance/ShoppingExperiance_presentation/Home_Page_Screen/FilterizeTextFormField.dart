import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

bool? Filter;
String FromOnsave = "";
String ToOnsave = "";
GlobalKey<FormState> priceFromKey = GlobalKey<FormState>();
GlobalKey<FormState> priceToKey = GlobalKey<FormState>();
TextEditingController priceToController = TextEditingController();
TextEditingController priceFromController = TextEditingController();

class PriceRangeFormField extends StatelessWidget {
  @override
  String? PriceType;
  GlobalKey<FormState> Pricekey;
  TextEditingController PriceController;
  PriceRangeFormField(this.PriceType, this.Pricekey, this.PriceController,
      {super.key});
  Widget build(BuildContext context) {
    final provider = Provider.of<FeatureProvider>(context);

    return Form(
      key: Pricekey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
            width: 80,
            child: TextFormField(
              controller: PriceController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return PriceType == "From"
                      ? "Write a Start Price"
                      : "Write a Last Price";
                }

                return null;
              },
              onSaved: (Val) {
                if (PriceType == "From") {
                  FromOnsave = Val!;
                } else if (PriceType == "To") {
                  ToOnsave = Val!;
                }
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
