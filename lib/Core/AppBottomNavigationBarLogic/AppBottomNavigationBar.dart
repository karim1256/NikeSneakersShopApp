import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.blue,
            hoverColor: Colors.blue,
            gap: 8,
            haptic: true,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.blue,
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Favourite',
              ),
              /*
              GButton(
                icon: Icons.notifications_outlined,
                text: 'Notifi',
              ),
              */
              GButton(
                icon: Icons.person_outlined,
                text: 'Profile',
              ),
            ],
            selectedIndex: Provider.of<FeatureProvider>(context).SelectedPage,
            onTabChange: (index) {
              // Directly change the page without setState
              Provider.of<FeatureProvider>(context, listen: false)
                  .ChangePage(index);
            },
          ),
        ),
      ),
    );
  }
}
