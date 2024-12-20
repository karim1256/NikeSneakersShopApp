import 'dart:js';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

Future<dynamic> SuccessOrder(BuildContext? c) {
  final p = Provider.of<FeatureProvider>(c!, listen: false);

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
                height: 270,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 50, left: 50, top: 40, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularAppcontainer(
                          Image.asset("lib/Core/Assets/SuccessOrder.png"),
                          size: 134,
                          ContainerColor: Color(0xffDFEFFF)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Your Payment Is Successful",
                          style: TextStyle(
                            fontSize: 20,
                          ))
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
                    TextButton(
                      onPressed: () {
                        p.ChangePage(0);
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => HomePage(),
                          ),
                        );
                      },
                      child: Text(
                        'Back To Shopping',
                        style: TextStyle(fontSize: 19, color: Bluetheme),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
}
