import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/CheckOut_Screen/CheckOut_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppScreen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/SearchBody.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/SingleProductView_Screen/SingleProductViewScreen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Offer_Page/OfferPage_Screen.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/ProfilePage/Profile_Screen.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/Payment_Option_Page/Payment_Option_Screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:nikesneakersshopapp/Features/Welcome/Welcome_Presentation/SplashViewPage.dart';
import 'package:nikesneakersshopapp/Features/Welcome/Welcome_Presentation/OnboardOne.dart';
import 'package:nikesneakersshopapp/Features/Welcome/Welcome_Presentation/OnboardTwo.dart';
import 'package:nikesneakersshopapp/Features/Welcome/Welcome_Presentation/OnboardThree.dart';
import 'package:nikesneakersshopapp/Features/SignUpSignIn/SignInPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FeatureProvider()),
        ChangeNotifierProvider(create: (context) => AccountServiceProvider()),
      ],
      builder: (context, child) {
        // Ensure the system UI overlays are visible, including the status bar

        return MaterialApp(
          home:
              // ProfileViewScreen(),
              // HomePage()
              // PaymentOptionsScreen()
              // OnboardPageOne(),
              // SignInPage()
              //
              SplashViewPage(),
          //CheckOut(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
