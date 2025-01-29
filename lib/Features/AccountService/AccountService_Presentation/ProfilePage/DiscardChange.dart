import 'dart:js';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'Profile_Body.dart';

Future<dynamic> DiscardChange(BuildContext c) {
  final p2 = Provider.of<AccountServiceProvider>(c, listen: false);
  final p = Provider.of<FeatureProvider>(c, listen: false);

  return showDialog(
      context: c,
      builder: (context) => AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Discard Changes",
                      style: TextStyle(fontSize: 22, color: Bluetheme)),
                ],
              ),
            ),
            actions: [
              Center(
                child: Column(
                  children: [
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Bluetheme,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          color: Bluetheme,
                        ),
                        TextButton(
                          onPressed: () {
                            if (p2.formKey.currentState?.validate() ?? false) {
                              p2.Profile = p2.ChangedProfile;
                              p2.SetChechChange = false;

                              Navigator.pop(context);

                              p.BottomNavigation(context);
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 22, color: Bluetheme),
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: Bluetheme,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            p2.SetChechChange = false;

                            Navigator.pop(context);
                            p.BottomNavigation(context);
                          },
                          child: Text(
                            'Discard',
                            style: TextStyle(fontSize: 22, color: Bluetheme),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ));
}
