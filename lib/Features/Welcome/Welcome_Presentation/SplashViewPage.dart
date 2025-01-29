import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/SignUpSignIn/SignInPage.dart';
import 'OnboardOne.dart';

class SplashViewPage extends StatefulWidget {
  const SplashViewPage({super.key});

  @override
  _SplashViewPageState createState() => _SplashViewPageState();
}

class _SplashViewPageState extends State<SplashViewPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next page after 3 seconds.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardPageOne()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bluetheme,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Image.asset(
            "lib/Core/Assets/WhiteNike.png",
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "lib/Core/Assets/Nike.png",
          ),
        ],
      ),
    );
  }
}
