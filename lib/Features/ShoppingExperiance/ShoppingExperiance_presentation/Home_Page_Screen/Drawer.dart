import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/ProfilePage/Profile_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    Widget ListDrawer(String title, int? index, {IconData? icon}) {
      return MaterialButton(
        onPressed: index != null
            ? () {
                p.ChangePage(index);

                p.BottomNavigation(context);
              }
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(color: GreyText, fontSize: 18),
              ),
              leading: icon != null
                  ? Icon(icon, color: GreyText)
                  : ImageIcon(
                      AssetImage(
                        "lib/Core/Assets/delivery.png",
                      ),
                      size: 30,
                    ),
            ),
            Divider(
              color: GreyText,
              indent: 30,
              endIndent: 90,
            )
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Bluetheme,
            width: 8,
          ),
          // bottom: BorderSide(
          //   color: Bluetheme,
          //   width: 5,
          // ),
          // top: BorderSide(
          //   color: Bluetheme,
          //   width: 5,
          // )
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Drawer(
        width: 240,
        backgroundColor: MainColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    // backgroundImage: AssetImage(
                    //     "assets/profile_picture.jpg"), // Replace with your image path
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Add functionality to change the profile picture
                    },
                    child: const Text(
                      "Change Profile Picture",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ListDrawer("Profile", 2, icon: Icons.person_2_outlined),
            ListDrawer("Settings", null, icon: Icons.settings_outlined),
            ListDrawer("Favourites", 1, icon: Icons.favorite_outline),
            // ListDrawer("Cart", CartScreen(), icon: Icons.shopping_bag_outlined),
            ListDrawer("Orders", null, icon: null),
            SizedBox(
              height: 25,
            ),
            Divider(thickness: 2, indent: 30, endIndent: 30, color: Bluetheme),
            ListDrawer("Logout", null, icon: Icons.logout_outlined),
          ],
        ),
      ),
    );
  }
}
