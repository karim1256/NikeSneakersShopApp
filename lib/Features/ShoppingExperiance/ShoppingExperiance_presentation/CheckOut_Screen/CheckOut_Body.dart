import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_PaymentSummary.dart';
import 'SeccessfulOrder.dart';

class CheckOutBody extends StatelessWidget {
  CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: 400,
            width: 310,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: ContainersColor,
                border: Border.all(
                  color: Bluetheme,
                  width: 2,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                // Email Information Row
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  title: Text(
                    'emmanueloiyiboke@gmail.com',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit_outlined,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),

                // Phone Information Row
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.phone_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  title: Text(
                    '+234-811-732-5298',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit_outlined,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 15),

                // Address Header
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '123 Maple Street, Apt 4B, Springfield, IL 62704, USA',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CartPaymentSummary('Place Order'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
