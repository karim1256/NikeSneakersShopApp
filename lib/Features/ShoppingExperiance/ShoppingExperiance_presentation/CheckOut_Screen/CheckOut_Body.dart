import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_PaymentSummary.dart';
import 'SeccessfulOrder.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/ProfilePage/Profile_Screen.dart';

class CheckOutBody extends StatelessWidget {
  CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p2 = Provider.of<AccountServiceProvider>(context);
    final p = Provider.of<FeatureProvider>(context);

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 380,
              width: 310,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: ContainersColor,
                  border: Border.all(
                    color: Bluetheme,
                    width: 2,
                  )),
              child: SingleChildScrollView(
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
                    SizedBox(height: 5),

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
                        p2.Profile["email"],
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
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  ProfileScreen(),
                            ),
                          );
                          p.ChangePage(2);
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),

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
                          p2.Profile["mobileNumber"],
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
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    ProfileScreen(),
                              ),
                            );
                            p.ChangePage(2);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(height: 10),

                    // Address Header
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      p2.Profile["address"],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('lib/Core/Assets/Location.png'),

                    Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'lib/Core/Assets/dbl_card_icon.png'), // Replace with your card image path
                      ),
                      title: Text(
                        "DbL Card",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("**** **** 0696 4629"),
                      trailing: Radio<String>(
                        value: "DbL Card",
                        groupValue: p.selectedPaymentMethod,
                        onChanged: (value) {
                          p.SetselectedPaymentMethod(value!);
                        },
                      ),
                    ),
                    ListTile(
                        leading: Text(
                          "  cash",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        trailing: Radio<String>(
                          value: "Cash",
                          groupValue: p.selectedPaymentMethod,
                          onChanged: (value) {
                            p.SetselectedPaymentMethod(value!);
                          },
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CartPaymentSummary('Place Order'),
      ],
    );
  }
}
