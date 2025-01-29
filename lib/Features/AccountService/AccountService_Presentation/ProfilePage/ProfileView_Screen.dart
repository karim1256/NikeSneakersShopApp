import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/data.dart'; // assuming this contains the 'users' data
import 'package:provider/provider.dart';
import 'Profile_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:nikesneakersshopapp/Core/AppBottomNavigationBarLogic/AppBottomNavigationBar.dart';
import 'Profile_AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/AppBar.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assuming 'users' is the list holding the user profile data
    var p = Provider.of<AccountServiceProvider>(context);

    // Helper function for rendering profile data
    Widget ProfileDataView(String label, dynamic data, IconData icon) {
      return Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: Bluetheme,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Bluetheme),
                ),
                Text(
                  data ?? "N/A", // Handle null or empty data
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: AppNavigationBar(),

      appBar: ApplicationAppBar(
        title: "Profile",
        titleSize: 20,
      ),
      backgroundColor: ContainersColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      p.Profile['profilePicture'] ??
                          'https://example.com/default.jpg',
                    ), // Replace with actual image URL or asset
                    backgroundColor: Colors.grey[200],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // Add functionality to change the profile picture
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // User Information Section
            Card(
              elevation: 14,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: MainColor,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Name
                    ProfileDataView("First Name", p.Profile['firstName'],
                        Icons.person_outline),
                    const Divider(),
                    // Last Name
                    ProfileDataView("Last Name", p.Profile['lastName'],
                        Icons.person_outline),
                    const Divider(),
                    // Address
                    ProfileDataView("Address", p.Profile['address'],
                        Icons.location_on_outlined),
                    const Divider(),
                    // Mobile Number
                    ProfileDataView("Mobile", p.Profile['mobileNumber'],
                        Icons.phone_android_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button to edit profile
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Profile Edit Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
        child: Icon(
          Icons.edit_outlined,
          color: ContainersColor,
          size: 22,
        ),
        backgroundColor: Bluetheme,
      ),
    );
  }
}
