import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/CheckOut_Screen/SeccessfulOrder.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/CheckOut_Screen/CheckOut_Screen.dart';

import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class CartPaymentSummary extends StatelessWidget {
  String ButtonText;
  CartPaymentSummary(this.ButtonText, {super.key});

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    // You can directly use getSubTotal() to get the total sum of SubTotal

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Subtotal and Delivery rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              Text(
                p
                    .getSubTotal()
                    .toStringAsFixed(2), // Call SubTotal() to get the value
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          p.Getapplydiscount
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Disscount',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    Text(
                      '${p.dispersentage}%',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                )
              : SizedBox(
                  height: 0,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              Text(
                '\$60.20',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),

          // Dashed Divider
          Container(
            width: double.infinity,
            height: 1,
          ),
          SizedBox(height: 13),

          // Total Cost
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$${(p.TotalCost()).toStringAsFixed(2)}', // Add the delivery cost to the subtotal
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // Checkout Button
          ElevatedButton(
            onPressed: ButtonText == 'Checkout'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const CheckOut(),
                      ),
                    );
                  }
                : () {
                    SuccessOrder(context);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              ButtonText,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
