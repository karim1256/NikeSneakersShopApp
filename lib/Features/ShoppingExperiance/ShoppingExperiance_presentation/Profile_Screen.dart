import 'dart:ui';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Text(
          "ProfilePage",
          style: TextStyle(fontSize: 40),
        ),
      )),
    );
  }
}
